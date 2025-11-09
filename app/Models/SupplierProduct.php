<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * NOTE: This model represents the legacy `supplier_products` table.
 * The project is migrating to the canonical pivot `item_supplier` linking
 * `items` <-> `suppliers`. Keep this model for backward compatibility
 * while controllers and views are migrated to use the pivot.
 */
class SupplierProduct extends Model
{
    use HasFactory;

    protected $fillable = ['supplier_id', 'product_name'];

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }
}
