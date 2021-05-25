<?php

/* 
$categories = Category::All()->pluck('category_name', 'category_name'); permet d'afffiher les categories
if($rquest->hasFile('product_image')){ si nous avons selestionner une image alors 


*/


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Category;
use App\Product;

class ProductController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function ajouterproduit(){
        $categories = Category::All()->pluck('category_name', 'category_name');
        return view('admin.ajouterproduit')->with('categories', $categories);
    }

    public function sauverproduit(Request $request){
        $this->validate($request, ['product_name' => 'required|unique:products',
                                  'product_price' => 'required',
                                  'product_category' => 'required',
                                 'product_image' => 'image|nullable|max:1999']);
       
        if($request->hasFile('product_image')){
            //1: nom du fichier avec son extension   
            $filenamewithExt = $request->file('product_image')->getClientOriginalName();
            //2: juste le nom du fichier 
            $fileName = pathinfo($filenamewithExt, PATHINFO_FILENAME);
            // 3: l'extension du fichier 
            $extension = $request->file('product_image')->getClientOriginalExtension();
            // 4: nom de l'image à inseré dans la base de donnée 
            $fileNameTotore = $fileName.'_'.time().'.'.$extension;

            //5 uploader : stocker l'image dans la base de donnée et dans le dossier de destination 
            $path = $request->file('product_image')->storeAs('public/product_images', $fileNameTotore);
        }else{
            $fileNameTotore = 'noimage.jpg';    
        }

        $product = new Product(); 

        $product->product_name  = $request->input('product_name');
        $product->product_price  = $request->input('product_price');
        $product->product_category  = $request->input('product_category');
        $product->product_image   = $fileNameTotore;
        $product->status = 1;

        $product->save();
        return redirect ('/ajouterproduit')->with('status', 'Le produit '.$product->product_name. ' a été ajouté avec succès');
        
    }

    public function produits(){

        $produits = Product::get();
        return view('admin.produits')->with('produits', $produits);

    }

    public function edit_produit($id){ 
        $product = Product::find($id);

        $categories = Category::All()->pluck('category_name', 'category_name');
        return view('admin.editproduit')->with('product', $product)->with('categories', $categories);

    }
    
    public function modifierproduit(Request $request){

        $this->validate($request, ['product_name' => 'required',
                        'product_price' => 'required',
                        'product_category' => 'required',
                        'product_image' => 'image|nullable|max:1999']);

        $product = Product::find($request->input('id')); 
        $product->product_name  = $request->input('product_name');
        $product->product_price  = $request->input('product_price');
        $product->product_category  = $request->input('product_category');

        if($request->hasFile('product_image')){
            //1: nom du fichier avec son extension   
            $filenamewithExt = $request->file('product_image')->getClientOriginalName();
            //2: juste le nom du fichier 
            $fileName = pathinfo($filenamewithExt, PATHINFO_FILENAME);
            // 3: l'extension du fichier 
            $extension = $request->file('product_image')->getClientOriginalExtension();
            // 4: nom de l'image à inseré dans la base de donnée 
            $fileNameTotore = $fileName.'_'.time().'.'.$extension;

            //5 uploader : stocker l'image dans la base de donnée et dans le dossier de destination 
            $path = $request->file('product_image')->storeAs('public/product_images', $fileNameTotore);

            if($product->product_image != 'noimage.jpg'){
                Storage::delete('public/product_images/'.$product->product_image);
            }
            $product->product_image = $fileNameTotore;
        }
        
        $product->update();
        return redirect ('/produits')->with('status', 'Le produit '.$product->product_name. ' a été modifié avec succès');   
    }

    public function supprimerproduit($id){
        $product = Product::find($id);

        if($product->product_image != 'noimage.jpg'){
            Storage::delete('public/product_images/'.$product->product_image);
        }

        $product->delete();

        return redirect('/produits')->with('status', 'Le produit'.$product->product_name.' a été supprimé avec succès!');  
    }
   
    public function activer_produit($id){
        $product = Product::find($id);

        $product->status = 1;

        $product->update();

        return redirect('/produits')->with('status', 'Le produit ' .$product->product_name. ' a été activé avec succès!'); 

    }

    public function desactiver_produit($id){
        $product = Product::find($id);

        $product->status = 0;

        $product->update();

        return redirect('/produits')->with('status', 'Le produit' .$product->product_name. ' a été desactivé avec succès!'); 

    }
    
    
}
