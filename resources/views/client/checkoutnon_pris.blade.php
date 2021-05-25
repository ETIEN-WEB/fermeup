
@extends('layouts.app1')



@section('content')


<div class="hero-wrap hero-bread" style="background-image: url('frontend/images/bg_1.jpg');">
  <div class="container">
    <div class="row no-gutters slider-text align-items-center justify-content-center">
      <div class="col-md-9 ftco-animate text-center">
          <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
        <h1 class="mb-0 bread">Checkout</h1>
      </div>
    </div>
  </div>
</div>

<section class="ftco-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-7 ftco-animate">

        <form action="{{url('/payer')}}" method="POST" class="form-horizontal" id="checkout-form">
            {{ csrf_field() }}  

       {{-- {!! Form::open(['action' => 'ProduitController@payer', 'method' => 'POST', 'class' => 'form-horizontal', 'id' => 'checkout-form', 'enctype' => 'multipart/form-data']) !!} --}}

              <h3 class="mb-4 billing-heading">Billing Details</h3>
              
                <h3 class="mb-4 billing-heading">{{Session::get('cart')->totalPrice }} $</h3>
              <div class="row align-items-end">





              <div class="col-md-12">
                   <div class="form-group">
                      <label for="firstname">Noms</label>
                      <input type="text" class="form-control" placeholder="" name="noms">
                   </div>
              </div>
              <div class="col-md-12">
                <div class="form-group">
                <label for="streetaddress">Adresse </label>
              <input type="text" class="form-control" placeholder="House number and street name" name="adresse">
            </div>
            </div>

            <div class="col-md-12">
              <div class="form-group">
                 <label for="firstname">Nom sur la carte</label>
                 <input type="text" class="form-control" placeholder="" id="card-name" >
              </div>
         </div>

         <div class="col-md-12">
          <div class="form-group">
             <label for="firstname">Numéro de la carte</label>
             <input type="text" class="form-control" placeholder="" id="card-number">
          </div>
         </div>
         <div class="col-md-6">
          <div class="form-group">
             <label for="firstname">Mois d'expiration</label>
             <input type="text" class="form-control" placeholder="" id="card-expiry-month">
          </div>
         </div>
         <div class="col-md-6">
          <div class="form-group">
             <label for="firstname">Année d'expiration</label>
             <input type="text" class="form-control" placeholder="" id="card-expiry-year">
          </div>
         </div>
         <div class="col-md-12">
          <div class="form-group">
             <label for="firstname">CVC</label>
             <input type="text" class="form-control" placeholder="" id="card-cvc">
              </div>
                 <input class="btn btn-success" type="submit" value="Payer">
              </div>







        </div>   
            <!--<div class="w-100"></div>-->
                    {!! Form::close() !!}
          <!-- END Form-->
        
    
      </div>
    </div>
  </div>
</section> <!-- .section -->

    <section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
  <div class="container py-4">
    <div class="row d-flex justify-content-center py-5">
      <div class="col-md-6">
          <h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
          <span>Get e-mail updates about our latest shops and special offers</span>
      </div>
      <div class="col-md-6 d-flex align-items-center">
        <form action="#" class="subscribe-form">
          <div class="form-group d-flex">
            <input type="text" class="form-control" placeholder="Enter email address">
            <input type="submit" value="Subscribe" class="submit px-3">
          </div>
        </form>
      </div>
    </div>
  </div>
</section>

@endsection


@section('scripts')

<script src="https://js.stripe.com/v2/"></script>
<script src="src/js/checkout.js"></script>
	
  <script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>

@endsection




















<div class="col-md-6">
  <div class="form-group">
<label for="firstname">Firt Name</label>
<input type="text" class="form-control" placeholder="">
 </div>
</div>

<div class="col-md-6">
<div class="form-group">
  <label for="lastname">Last Name</label>
  <input type="text" class="form-control" placeholder="">
</div>
</div>

<div class="w-100"></div>
<div class="col-md-12">
<div class="form-group">
  <label for="country">State / Country</label>
  <div class="select-wrap">
<div class="icon"><span class="ion-ios-arrow-down"></span></div>
<select name="" id="" class="form-control">
<option value="">France</option>
<option value="">Italy</option>
<option value="">Philippines</option>
<option value="">South Korea</option>
<option value="">Hongkong</option>
<option value="">Japan</option>
</select>
  </div>
</div>
</div>

<div class="w-100"></div>
<div class="col-md-6">
<div class="form-group">
  <label for="streetaddress">Street Address</label>
  <input type="text" class="form-control" placeholder="House number and street name">
</div>
</div>
<div class="col-md-6">
<div class="form-group">
  <input type="text" class="form-control" placeholder="Appartment, suite, unit etc: (optional)">
</div>
</div>
<div class="w-100"></div>
<div class="col-md-6">
<div class="form-group">
  <label for="towncity">Town / City</label>
  <input type="text" class="form-control" placeholder="">
</div>
</div>
<div class="col-md-6">
<div class="form-group">
  <label for="postcodezip">Postcode / ZIP *</label>
  <input type="text" class="form-control" placeholder="">
</div>
</div>
<div class="w-100"></div>
<div class="col-md-6">
<div class="form-group">
  <label for="phone">Phone</label>
  <input type="text" class="form-control" placeholder="">
</div>
</div>
<div class="col-md-6">
<div class="form-group">
<label for="emailaddress">Email Address</label>
<input type="text" class="form-control" placeholder="">
</div>
</div>
<div class="col-md-12">
<div class="form-group">
<input type="submit" class="form-control" placeholder="">
</div>
</div>






















