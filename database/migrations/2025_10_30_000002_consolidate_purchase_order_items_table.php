<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasTable('purchase_order_items')) {
            Schema::table('purchase_order_items', function (Blueprint $table) {
                if (!Schema::hasColumn('purchase_order_items', 'product_name')) {
                    $table->string('product_name')->nullable()->after('item_id');
                }
                if (!Schema::hasColumn('purchase_order_items', 'unit')) {
                    $table->string('unit')->nullable()->after('product_name');
                }
                if (!Schema::hasColumn('purchase_order_items', 'subtotal')) {
                    $table->decimal('subtotal', 14, 2)->nullable()->after('unit');
                }
                if (!Schema::hasColumn('purchase_order_items', 'notes')) {
                    $table->text('notes')->nullable()->after('subtotal');
                }
            });

            // Copy existing item_name -> product_name if present
            if (Schema::hasColumn('purchase_order_items', 'item_name') && Schema::hasColumn('purchase_order_items', 'product_name')) {
                // update in chunks to avoid memory issues
                DB::table('purchase_order_items')->whereNotNull('item_name')->whereNull('product_name')->chunkById(200, function ($rows) {
                    foreach ($rows as $r) {
                        DB::table('purchase_order_items')->where('id', $r->id)->update(['product_name' => $r->item_name]);
                    }
                });
            }
        }
    }

    public function down(): void
    {
        // non-destructive: keep both columns to avoid data loss.
    }
};
