<?php
namespace Main\Traits;

use Illuminate\Http\Request;
use Hash;
use Main\Models\User as User;
use Main\Models\Restaurants as Restaurants;
use  Admin\Models\Users_model as Users_model;

trait Validation
{
    public function createsubdomain_validation($requestData)
    {
        $validate = array(
            "status"   => true,
            "message"  => "",
            "ref"      => "",
        );
        $username = Users_model::where(['username' => strtolower($requestData['username'])])->first();
        if(!empty($username))
        {
            $validate['status']  = false;
            $validate['message'] = lang('main::messages.error_username_exist');
            $validate['ref']     = "error_username_exist";
            return $validate;
        }
        $user = User::where(['email' => strtolower($requestData['email']), "deleted" => '0'])->first();
        if(!empty($user))
        {
            $validate['status']  = false;
            $validate['message'] = lang('main::messages.error_email_exist');
            $validate['ref']     = "error_email_exist";
            return $validate;
        }
        $subdomain = Restaurants::where(['subdomain' => strtolower($requestData['subdomain']), "deleted" => '0'])->first();
        
        if(!empty($subdomain))
        {
            $validate['status']  = false;
            $validate['message'] = lang('main::messages.error_subdomain_exist');
            $validate['ref']     = "error_subdomain_exist";
            return $validate;
        }
        if($requestData['password'] != $requestData['confirmpassword'])
        {
            $validate['status']  = false;
            $validate['message'] = lang('main::messages.error_newpassword_confirmpassword');
            $validate['ref']     = "error_newpassword_confirmpassword";
            return $validate;
        }

        
        return $validate;
    }

    // public function subdomainuserlogin_validation($requestData)
    // {
    //     $validate = array(
    //         "status"   => true,
    //         "message"  => "",
    //         "ref"      => "",
    //     );
    //     $subdomain_exists = Restaurants::where(['subdomain' => strtolower($requestData['subdomain']), "deleted" => '0' , 'status' => '1'])->first();
    //     if(empty($subdomain_exists))
    //     {
    //         $validate['status']  = false;
    //         $validate['message'] = trans('messages.error_subdomain_invalid');
    //         $validate['ref']     = "error_subdomain_invalid";
    //         return $validate;
    //     }
    //     $validate['restaurant'] = $subdomain_exists;
    //     $user_exists = User::where(['email' => strtolower($requestData['email']),"deleted" => "0","status"=>"1"])->first();
    //     if(empty($user_exists))
    //     {
    //         $validate['status']  = false;
    //         $validate['message'] = trans('messages.error_email_invalid');
    //         $validate['ref']     = "error_email_invalid";
    //         return $validate;
    //     }
    //     if(!Hash::check($requestData['password'], $user_exists['password']))
    //     {
    //         $validate['status']  = false;
    //         $validate['message'] = trans('messages.error_password_invalid');
    //         $validate['ref']     = "error_password_invalid";
    //         return $validate;
    //     }
    //     if($user_exists['restaurant_id'] != $subdomain_exists['id'])
    //     {
    //         $validate['status']  = false;
    //         $validate['message'] = trans('messages.error_email_subdomain_invalid');
    //         $validate['ref']     = "error_email_subdomain_invalid";
    //         return $validate;
    //     }
    //     return $validate;
    // }
}