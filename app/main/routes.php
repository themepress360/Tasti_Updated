<?php
App::before(function () {
    /*
     * Register Main app routes
     *
     * The Main module intercepts all URLs that were not
     * handled by the admin modules.
     */
    
    Route::group([
        'middleware' => ['web'],
    ], function () {
        
        Route:: get ('/register','main\Controllers\Register@index');
        Route::post('/subdomaincreate','main\Controllers\Register@subdomaincreate');
        Route::get('/ready/{id}', 'main\Controllers\Register@ready');
        Route::get('/subadmin', 'main\Controllers\Register@adminlogin');
        
        // Register Assets Combiner routes
        Route::any(config('system.assetsCombinerUri', '_assets').'/{asset}', 'System\Classes\Controller@combineAssets');
       
        
        Route::any('{slug}', 'System\Classes\Controller@run')
            ->where('slug', '(.*)?')
            ->middleware(\Igniter\Flame\Foundation\Http\Middleware\VerifyCsrfToken::class);
            
    });

});
