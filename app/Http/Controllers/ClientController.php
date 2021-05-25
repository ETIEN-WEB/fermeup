<?php

/*
$email = Session::get('client')->email; 
prend le mail du client dans la base de donnée



*/


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Slider;
use App\Category;
use App\Product;
use App\Order;
use App\Client;
use App\Cart;
use App\Session;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Hash;
use Stripe\Charge;
use Stripe\Stripe;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMail;

class ClientController extends Controller
{
    //
    public function home(){
        $sliders = Slider::where('status', 1)->get();
        $produits = Product::where('status', 1)->orderBy('id', 'desc')->paginate(8);
        return view('client.home')->with('sliders', $sliders)->with('produits', $produits);
    }

    public function shop(){
        $categories = Category::get();
        $produits = Product::where('status', 1)->orderBy('id', 'desc')->paginate(8);
        return view('client.shop')->with('categories', $categories)->with('produits', $produits);
      
        //$datas = Todo::where(['affectedTo_id' => $userId])->orderBy('id', 'desc')->paginate(10);
    }

    public function select_par_cat($name){
        $categories = Category::get();
        $produits = Product::where('product_category', $name)->where('status', 1)->orderBy('id', 'desc')->paginate(8);
       
        return view('client.shop')->with('produits', $produits)->with('categories', $categories);
    }      

    public function ajouter_au_panier($id){
        
        $produit = Product::find($id);

        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = New Cart($oldCart);
        $cart->add($produit, $id);
        Session::put('cart', $cart);

        //dd(Session::get('cart'));
        return redirect('/shop');

        
        //return view('client.ajouter_au_panier');
    }

    
    public function panier(){

        if(!Session::has('cart')){
            return view('client.cart');
        }
    
        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = New Cart($oldCart);
    
        return view('client.cart', ['products' => $cart->items]); 
    }

    public function modifier_panier(Request $request, $id){

        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = New Cart($oldCart);
        $cart->updateQty($id, $request->quantity);
        Session::put('cart', $cart);
        
        //dd(Session::get('cart'));
        return redirect::to('/panier');
        //return view('client.modifier_panier');
    }
    
    public function retirer_produit($id){
        $oldCart = Session::has('cart')? Session::get('cart'):null;
    $cart = New Cart($oldCart);
    $cart->removeItem($id);
    
    if(count([$cart->items]) > 0 ) {
        
        Session::put('cart', $cart);
    } else {
        
        Session::forget('cart');
    }
    
    
    //dd(Session::get('cart'));
    return redirect('/panier');
    }
    
    public function paiement(){

        if(!Session::has('client')){
            return view('client.login');
        }

        if(!Session::has('cart')){
            return view('client.cart');
        }

       return view('client.checkout');
    } 

    public function payer(Request $request){

        if(!Session::has('cart')){
            return view('client.cart');
        }

        $oldCart = Session::has('cart')? Session::get('cart'):null;
        $cart = New Cart($oldCart);

        Stripe::setApiKey('sk_test_51HOG0sGf4lUyrBwoBkLB8Hl7x8Fx0jOrTqXsf1vgtd9i6JXbJisYsJ5xPWTRcmi0koLhprMtCvohyo4yEcZdvjFr00MF7gLckn');

        try{

            $charge = Charge::create(array(
                "amount" => $cart->totalPrice * 100,
                "currency" => "usd",
                "source" => $request->input('stripeToken'), // obtainded with Stripe.js
                "description" => "Test Charge"
            ));

            $order = new Order();

            $order->nom = $request->input('name');
            $order->adresse = $request->input('adress');
            $order->panier = serialize($cart);
            $order->payement_id = $charge->id;

            $order->save();
          
            $orders = Order::where('payement_id', $charge->id)->get();
 
            $orders->transform(function($order, $key){
                $order->panier = unserialize($order->panier);
            return $order;

            
            });
            $email = Session::get('client')->email; 

            Mail::to($email)->send(new SendMail($orders));


        } catch(\Exception $e){
            Session::put('error',  $e->getMessage());
            return redirect('/paiement');
        }

        Session::forget('cart');
        //Session::put('success', 'Purchase accomplished successfully !');
        return redirect('/panier')->with('status', 'Achet éffectué avec succès');

    } 
    
    public function creer_compte(Request $request){
        $this->validate($request, ['email' => 'email|required|unique:clients',
                                   'password' => 'required|min:4']);
        
        $client = new Client();
        
        $client->email = $request->input('email');
        $client->password = bcrypt($request->input('password'));

        $client->save();

        return back()->with('status', 'Votre compte a été créé avec succès');
    } 

    public function acceder_compte(Request $request){
        $this->validate($request, ['email' => 'email|required',
                                   'password' => 'required']);
     /* Vérification si l'email en question se trouve dns la BD */    
       
        $client = Client::where('email', $request->input('email'))->first();

        if ($client) {
            # code...
            if (Hash::check($request->input('password'), $client->password)) {
                # code...
                Session::put('client', $client);
                return redirect('/shop');
            } else {
                # code...*
                return back()->with('status', 'Mauvais mot de passe ou email');
            }
            
        } else {
            # code...   
            return back()->with('status', 'Vous n\'avez pas de compte');
        }
        

        //return view('client.acceder_compte');
    } 
    
    public function logout(){
        Session::forget('client');
        return back();
    } 
    

    public function client_login(){
        return view('client.login');
    } 

    public function signup(){
        return view('client.signup');
    }   

    


     
   

    
    
  
}
