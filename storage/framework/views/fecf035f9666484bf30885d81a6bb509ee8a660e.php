<!DOCTYPE html>
<html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script type="text/javascript">
         //var base_url = '<?php //echo URL::to('/'); ?>/';
         var base_url = '<?php echo "http://" . $_SERVER['SERVER_NAME']."/"; ?>';
         var access_token = '';
         
      </script>
      <script>
         window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
            ]); ?>
      </script>
      <style>
         .input-subdomain{
         border: 1px solid #222;
         width: 235px;
         margin-left: 84px;
         }
      </style>
      <link rel="stylesheet" href="<?php echo URL::to('/');?>/app/main/assets/admin/css/register.css" >
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" type="text/css">
      <script src="<?php echo URL::to('/');?>/app/main/assets/admin/js/jquery.min.js"></script>
      <script src="<?php echo URL::to('/');?>/app/main/assets/admin/js/bootstrap.min.js"></script>
      <link rel="stylesheet" type="text/css" href="https://dev-tollpays.amaxzatech.com/public/administration/default/css/toastr.min.css" />
      <script src="https://dev-tollpays.amaxzatech.com/public/administration/default/js/toastr.min.js"></script> 
      <script src="<?php echo URL::to('/');?>/app/main/assets/admin/js/common.js"></script>
   </head>
   <body>
      <form id="addSubDomainForm">
         <div class="content">
            <h1 class="text-color">www.restaurantsoftware.com</h1>
            <p class="text-color p-font m-t-50 m-b-50">Create your Website !</p>
            <div class="m-b-50">
               <input class="m-b-20" type="text" placeholder="Restaurant Name" name="name" />
               <div class="input-group">
                  <input class="m-b-20 input-subdomain" type="text" placeholder="Subdomain" name="subdomain" /> 
                  <div class="input-group-append" style="height:54px;">
                     <span class="input-group-text" id="basic-addon2"> <?php echo '.'.$_SERVER['SERVER_NAME'];?></span>
                  </div>
               </div>
               <input class="m-b-20" type="email" placeholder="Email" name="email"/>
               <input class="m-b-20" type="text" placeholder="User Name" name="username"/>
               <input class="m-b-20" type="password" placeholder="Password" name="password" />
               <input class="m-b-20" type="password" placeholder="Confirm Password" name="confirmpassword" />
                 <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
            </div>
            <button type="button" class="btn p-font btn-border ajax svBtn" method="subdomaincreate" validate="1" callback="addSubDomainCallback" formid="addSubDomainForm" style="background-color:#2BAD44;color:#fff">Make Site !</button>
         </div>
      </form>
      <script type="text/javascript">
         function addSubDomainCallback(response)
         {
          toastr['success']("Sub Domain add successfully.");
            window.location = base_url + 'ready/' +response.data.restaurant_id; 
         }
      </script>
   </body>
</html><?php /**PATH /var/www/tastyignitor/app/main/views/register/index.blade.php ENDPATH**/ ?>