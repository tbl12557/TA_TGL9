<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (Schema::hasTable('transactions')) {
            Schema::table('transactions', function (Blueprint $table) {
                if (!Schema::hasColumn('transactions', 'channel')) {
                    $table->string('channel')->nullable()->after('payment_method_id');
                }
                if (!Schema::hasColumn('transactions', 'payment_status')) {
                    $table->string('payment_status')->nullable()->after('status');
                }
                if (!Schema::hasColumn('transactions', 'pickup_status')) {
                    $table->string('pickup_status')->nullable()->after('payment_status');
                }
                if (!Schema::hasColumn('transactions', 'pickup_code')) {
                    $table->string('pickup_code')->nullable()->after('pickup_status');
                }
            });
        }
    }

    public function down(): void
    {
        // non-destructive: do not drop columns automatically
    }
};
