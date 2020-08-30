<?php namespace Main\Controllers;
use Response;
use View;
use Validator;
use Illuminate\Http\Request;
use Main\Models\User as User;
use Admin\Models\Users_model as AdminUsersModel;
use Main\Models\Restaurants as Restaurants;
use Artisan;
use DB;
use Config;

class Register extends CommonController
{
	use \main\traits\Validation;
    use \main\traits\TableTrait;
    public function index()
    {
    	return Response::make(
            View::make('main::register/index', []),
             	200
            );
    }

    public function subdomaincreate(Request $request)
    {
    	
    	$rules = [
            'name'      => 'required|min:3|max:30',
            'subdomain' => 'required|min:3|max:10',
            'email' => 'required|email',
            'password' => 'required|min:3|max:30',
            'confirmpassword' => 'required|min:3|max:30'
        ];

        $validator = Validator::make($request->all(),$rules);

        if (!$validator->fails()) {

        	$requestData = $request->all();
        	$custom_validate = $this->createsubdomain_validation($requestData);
        	
        	if($custom_validate['status'])
        	{
                $import_sql_file = file_get_contents(dirname(dirname(__FILE__)).'/tables.sql');
                
                $replace_prefix = str_replace('ti_', strtolower($requestData['subdomain']).'_',$import_sql_file);
                DB::unprepared($replace_prefix);

                $staff = \Admin\Models\Staffs_model::firstOrNew(['staff_email' => strtolower($requestData['email'])]);
                $staff->staff_name = $requestData['username'];
                $staff->staff_role_id = \Admin\Models\Staff_roles_model::first()->staff_role_id;
                $staff->language_id = \System\Models\Languages_model::first()->language_id;
                $staff->timezone = FALSE;
                $staff->staff_status = TRUE;
                $staff->save();

                $user = \Admin\Models\Users_model::firstOrNew(['username' => strtolower($requestData['username'])]);
                $user->staff_id = $staff->staff_id;
                $user->password = $requestData['password'];
                $user->super_user = TRUE;
                $user->is_activated = TRUE;
                $user->date_activated = \Carbon\Carbon::now();
                $user->save();

                        // $queries = DB::getQueryLog();
                        //  print_r(end($queries));
                        // exit();
        		$add_restaurant = Restaurants::add([
                    'name'      => $requestData['name'],
                    'subdomain' => strtolower($requestData['subdomain']),
                    'status'    => '1',
                    'deleted'   => '0',
                ]);
        		if($add_restaurant)
        		{
                    $data['restaurant_id'] = $add_restaurant['id'];
        			$add_user = User::create([
                        'name'      => $requestData['name'],
                        'email' => strtolower($requestData['email']),
                        'restaurant_id' => (int) $add_restaurant['id'],
                        'password' => \Hash::make($requestData['password']),
                        'is_primary' => '1',
                        'status'    => '1',
                        'deleted'   => '0',
                	]);
                	if($add_user)
                	{

                        $status = 201;
                        $response = array(
                            'status' => 'SUCCESS',
                            'data'   => ['restaurant_id' => $add_restaurant['id']],
                            'ref'    => 'restaurant_created',
                        );
                	}
                	else
                	{
                		$status = 500;
	                    $response = array(
	                        'status'  => 'FAILED',
	                        'message' => lang('main::messages.server_error'),
	                        'ref'     => 'server_error',
	                    );
                	}
        			
        		}
        		else
        		{
        			$status = 500;
                    $response = array(
                        'status'  => 'FAILED',
                        'message' => lang('main::messages.server_error'),
                        'ref'     => 'server_error',
                    );
        		} 
            }
            else
	        {
	            $status = 400;
	            $response = array(
	                'status'  => 'FAILED',
	                'message' => $custom_validate['message'],
	                'ref'     => $custom_validate['ref'],
	            );
	        }
        } else {
            $status = 400;
            $response = array(
                'status'  => 'FAILED',
                'message' => $validator->messages()->first(),
                'ref'     => 'missing_parameters',
            );
        }
        return $this->response($response,$status); 
    }

    public function ready($subdomainID)
    {
        $is_subdomain_exists = Restaurants::where(['id' => (int) $subdomainID,"status" => '1' ,"deleted" => '0'])->first();
        if($is_subdomain_exists)
        {
            $data['is_subdomain_exists'] = $is_subdomain_exists;
            return Response::make(
            View::make('main::register/ready', $data),
                200
            );
        }
        else
        {
            print_r("Invalid Subdomain Id");
            exit();
        }
    }

}