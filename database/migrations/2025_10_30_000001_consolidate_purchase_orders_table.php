<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasTable('purchase_orders')) {
            Schema::table('purchase_orders', function (Blueprint $table) {
                if (!Schema::hasColumn('purchase_orders', 'purchase_request_id')) {
                    $table->unsignedBigInteger('purchase_request_id')->nullable()->after('po_date');
                    // add FK if table exists
                    if (Schema::hasTable('purchase_requests')) {
                        $table->foreign('purchase_request_id')->references('id')->on('purchase_requests')->onDelete('set null');
                    }
                }

                if (!Schema::hasColumn('purchase_orders', 'total_amount')) {
                    $table->decimal('total_amount', 14, 2)->nullable()->after('status');
                }

                if (!Schema::hasColumn('purchase_orders', 'supplier_confirmed')) {
                    $table->boolean('supplier_confirmed')->default(false)->after('total_amount');
                }

                if (!Schema::hasColumn('purchase_orders', 'supplier_notes')) {
                    $table->text('supplier_notes')->nullable()->after('supplier_confirmed');
                }

                if (!Schema::hasColumn('purchase_orders', 'invoice_image_path')) {
                    $table->string('invoice_image_path')->nullable()->after('supplier_notes');
                }
            });
        }
    }

    public function down(): void
    {
        // non-destructive: do not drop columns automatically
    }
};
