<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class CategoryController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }
    
    public function ajoutercategorie(){
        return view('admin.ajoutercategorie');
    }

    public function sauvercategorie(Request $request){

        $this->validate($request,       ['category_name' => 'required|unique:categories']);
        $catogorie = new Category();
        $catogorie->category_name = $request->input('category_name');

        $catogorie->save();

       return redirect ('/ajoutercategorie')->with('status', 'La categorie '.$catogorie->category_name. ' a été ajouté avec succès');   
    }

    public function categories(){

        $categories = Category::get();

        return view('admin.categories')->with('categories', $categories);
    }

    public function edit_categorie($id){
        $categorie = Category::find($id);

        return view('admin.editcategorie')->with('categorie', $categorie);

    }

    public function modifiercategorie(Request $request){
        $this->validate($request,       ['category_name' => 'required|unique:categories']);

        $catogorie = Category::find($request->input('id'));

        $catogorie->category_name = $request->input('category_name');

        $catogorie->update();

       return redirect ('/categories')->with('status', 'La categorie '.$catogorie->category_name. ' a été modifiée avec succès');

    }




    
    
}
