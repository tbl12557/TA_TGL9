<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('supplier_products') || !Schema::hasTable('item_supplier') || !Schema::hasTable('items') || !Schema::hasTable('suppliers')) {
            return; // required tables not present
        }

        // Ensure there's an "Uncategorized" category to attach placeholder items if needed
        $uncatId = DB::table('categories')->where('name', 'Uncategorized')->value('id');
        if (!$uncatId) {
            $uncatId = DB::table('categories')->insertGetId([
                'name' => 'Uncategorized',
                'description' => 'Automatically created placeholder category',
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s'),
            ]);
        }

        // Process supplier_products in chunks
        DB::table('supplier_products')->orderBy('id')->chunkById(200, function ($rows) use ($uncatId) {
            foreach ($rows as $row) {
                $productName = trim($row->product_name);

                // Try to find matching item by exact name
                $item = DB::table('items')->where('name', $productName)->first();

                if ($item) {
                    $itemId = $item->id;
                } else {
                    // Create placeholder item (minimal fields)
                    // generate a unique code
                    $code = 'SP-' . strtoupper(substr(md5($productName . $row->supplier_id . time()), 0, 8));
                    $itemId = DB::table('items')->insertGetId([
                        'name' => $productName,
                        'code' => $code,
                        'category_id' => $uncatId,
                        'cost_price' => 0,
                        'selling_price' => 0,
                        'stock' => 0,
                        'picture' => 'default.png',
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    ]);
                }

                // Insert pivot if not exists
                $exists = DB::table('item_supplier')
                    ->where('item_id', $itemId)
                    ->where('supplier_id', $row->supplier_id)
                    ->exists();

                if (!$exists) {
                    DB::table('item_supplier')->insert([
                        'item_id' => $itemId,
                        'supplier_id' => $row->supplier_id,
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    ]);
                }
            }
        });
    }

    public function down(): void
    {
        // non-destructive: do not remove generated items or pivot entries automatically
    }
};
