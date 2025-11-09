<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasTable('supplier_products')) {
            $count = DB::table('supplier_products')->count();
            // Only drop table automatically if it's empty (safety measure)
            if ($count === 0) {
                Schema::dropIfExists('supplier_products');
            }
        }
    }

    public function down(): void
    {
        // cannot recreate schema automatically in down()
    }
};
