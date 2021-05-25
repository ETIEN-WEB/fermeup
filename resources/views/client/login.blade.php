<!DOCTYPE html>
<html lang="en">


<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>JustDo Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="backend/css/themify-icons.css">
  <link rel="stylesheet" href="backend/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="backend/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="backend/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="backend/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
                @if (Session::has('status'))
                <div class="alert alert-danger">
                  {{Session::get('status')}}
                </div>
                @endif
                @if (count($errors)> 0)
                  <div class="alert      alert-danger">
                  <ul> 
                    @foreach ($errors->all() as $error)
                      <li>{{$error}} </li>  
                    @endforeach
                  </ul> 
                </div>
                @endif
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <a href="{{URL::to('/')}}">
                <img src="http://www.urbanui.com/justdo/template/images/logo.svg" alt="logo">
              </a>
              </div>
              <h6 class="font-weight-light">Se connecter.</h6>
              <form action="{{url('/acceder_compte')}}" method="POST" class="pt-3">
                {{ csrf_field() }}

                <fieldset>
                    <div class="form-group">
                        <input type="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="nom d'utilisateur" name="email" >
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="mot de passe" name="password">
                    </div>
                    <div class="mt-3">
                      <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">
                        Login
                        </button>
                    </div>
                </fieldset>
            </form>
            <div class="mt-3">
              N'avez-vous pas un compte?
              <a href="{{URL::to('/signup')}}">
                 S'enregistrer
              </a>
           </div>

            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="backend/js/vendor.bundle.base.js"></script>
  <script src="backend/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="backend/js/off-canvas.js"></script>
  <script src="backend/js/hoverable-collapse.js"></script>
  <script src="backend/js/template.js"></script>
  <script src="backend/js/settings.js"></script>
  <script src="backend/js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>
