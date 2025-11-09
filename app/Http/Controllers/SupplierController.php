<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use App\Models\SupplierProduct;
use App\Models\Item;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class SupplierController extends Controller
{
   
    public function index(): View
    {
        return view('inventory.supplier.index', [
            // prefer items pivot for supplier products
            'suppliers' => Supplier::with('items')->orderBy('name')->get(),
            'type' => 'show'
        ]);
    }

    public function create(): View
    {
        return view('inventory.supplier.form', [    
            'type' => 'create'
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:suppliers,name',
            'address' => 'required|string',
            'phone' => 'required|numeric',
            'email' => 'nullable|email',
            'description' => 'nullable|string',
            'products' => 'nullable|array',
            'products.*' => 'nullable|string|max:255',
        ]);

        $supplier = Supplier::create([
            'name' => $request->name,
            'address' => $request->address,
            'phone' => $request->phone,
            'email' => $request->email,
            'description' => $request->description,
        ]);

        // Simpan produk manual jika tersedia
        if ($request->has('products')) {
            $attachIds = [];
            foreach ($request->products as $product_name) {
                $product_name = trim($product_name);
                if ($product_name === '') continue;
                // Try find existing item by name or create a placeholder
                $item = Item::firstOrCreate([
                    'name' => $product_name
                ], [
                    'category_id' => null,
                    'price' => 0,
                    'stock' => 0
                ]);
                $attachIds[] = $item->id;
            }
            if (!empty($attachIds)) {
                $supplier->items()->syncWithoutDetaching($attachIds);
            }
        }

        return redirect()->route('supplier.index')->with('status', 'Supplier berhasil ditambahkan');
    }

    public function edit(Supplier $supplier): View
    {
        return view('inventory.supplier.form', [
            'supplier' => $supplier->load('items'),
            'type' => 'edit'
        ]);
    }

    public function update(Request $request, Supplier $supplier): RedirectResponse
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:suppliers,name,' . $supplier->id,
            'address' => 'required|string',
            'phone' => 'required|numeric',
            'email' => 'nullable|email',
            'description' => 'nullable|string',
            'products' => 'nullable|array',
            'products.*' => 'nullable|string|max:255',
        ]);

        $supplier->update([
            'name' => $request->name,
            'address' => $request->address,
            'phone' => $request->phone,
            'email' => $request->email,
            'description' => $request->description,
        ]);

        // Sync supplier items via pivot (create placeholder Items if necessary)
        if ($request->has('products')) {
            $attachIds = [];
            foreach ($request->products as $product_name) {
                $product_name = trim($product_name);
                if ($product_name === '') continue;
                $item = Item::firstOrCreate([
                    'name' => $product_name
                ], [
                    'category_id' => null,
                    'price' => 0,
                    'stock' => 0
                ]);
                $attachIds[] = $item->id;
            }
            // Replace existing supplier items with the provided list
            $supplier->items()->sync($attachIds);
        } else {
            // If no products provided, detach all
            $supplier->items()->detach();
        }


        return redirect()->route('supplier.index')->with('status', 'Supplier berhasil diubah');
    }

    public function destroy(Supplier $supplier): RedirectResponse
    {
        // Detach pivot links to items then delete supplier
        $supplier->items()->detach();
        $supplier->delete();

        return redirect()->route('supplier.index')->with('status', 'Supplier berhasil dihapus');
    }
}

