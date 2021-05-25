<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Slider;

class SliderController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function ajouterslider(){
        return view('admin.ajouterslider');
    }

    public function sauverslider(Request $request){
        $this->validate($request, ['description1' => 'required',
                                  'description2' => 'required',
                                 'slider_image' => 'image|nullable|max:1999']);
       
        if($request->hasFile('slider_image')){
            //1: nom du fichier avec son extension   
            $filenamewithExt = $request->file('slider_image')->getClientOriginalName();
            //2: juste le nom du fichier 
            $fileName = pathinfo($filenamewithExt, PATHINFO_FILENAME);
            // 3: l'extension du fichier 
            $extension = $request->file('slider_image')->getClientOriginalExtension();
            // 4: nom de l'image à inseré dans la base de donnée 
            $fileNameTotore = $fileName.'_'.time().'.'.$extension;

            //5 uploader : stocker l'image dans la base de donnée et dans le dossier de destination 
            $path = $request->file('slider_image')->storeAs('public/slider_images', $fileNameTotore);
        }else{
            $fileNameTotore = 'noimage.jpg';    
        }

            $slider = new Slider(); 

            $slider->description1  = $request->input('description1');
            $slider->description2  = $request->input('description2');
            $slider->slider_image   = $fileNameTotore;
            $slider->status = 1;

            $slider->save();
            return redirect ('/ajouterslider')->with('status', 'Le slider a été ajouté avec succès!');
            
            //return view('admin.sauverslider');
    }

    public function sliders(){
        $sliders = Slider::get();
        return view('admin.sliders')->with('sliders', $sliders);
    }

    public function edit_slider($id){
        $slider = Slider::find($id);
        return view('admin.editslider')->with('slider', $slider);
    }
 
    public function modifierslider(Request $request){

        $this->validate($request, ['description1' => 'required',
                                  'description2' => 'required',
                                 'slider_image' => 'image|nullable|max:1999']);

        $slider = Slider::find($request->input('id')); 
        $slider->description1  = $request->input('description1');
        $slider->description2  = $request->input('description2');
          

        if($request->hasFile('slider_image')){
            //1: nom du fichier avec son extension   
            $filenamewithExt = $request->file('slider_image')->getClientOriginalName();
            //2: juste le nom du fichier 
            $fileName = pathinfo($filenamewithExt, PATHINFO_FILENAME);
            // 3: l'extension du fichier 
            $extension = $request->file('slider_image')->getClientOriginalExtension();
            // 4: nom de l'image à inseré dans la base de donnée 
            $fileNameTotore = $fileName.'_'.time().'.'.$extension;

            //5 uploader : stocker l'image dans la base de donnée et dans le dossier de destination 
            $path = $request->file('slider_image')->storeAs('public/slider_images', $fileNameTotore);

            if($slider->slider_image != 'noimage.jpg'){
                Storage::delete('public/slider_images/'.$slider->slider_image);
            }
            $slider->slider_image = $fileNameTotore;
        }
        
        $slider->update();
        return redirect ('/sliders')->with('status', 'Le slider a été modifié avec succès'); 
    }

    public function supprimerslider($id){
        $slider = Slider::find($id);

        if($slider->slider_image != 'noimage.jpg'){
            Storage::delete('public/slider_images/'.$slider->slider_image);
        }

        $slider->delete();

        return redirect('/sliders')->with('status', 'Le slider a été supprimé avec succès!'); 
    }
   

    public function activer_slider($id){

        $slider = Slider::find($id);

        $slider->status = 1;

        $slider->update();

        return redirect('/sliders')->with('status', 'Le slider a été activé avec succès!'); 
    }   


    public function desactiver_slider($id){
        $slider = Slider::find($id);

        $slider->status = 0;

        $slider->update();

        return redirect('/sliders')->with('status', 'Le slider a été desactivé avec succès!');
    }


    



    
    
     
}
