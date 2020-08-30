<?php

namespace Main\Models;
use Model;

class User extends CommonModel
{
     protected $table = 'custom_users';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    public $fillable = [
        'name', 'email', 'password','status','deleted','is_primary','restaurant_id','is_superadmin'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    public $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    public $casts = [
        'email_verified_at' => 'datetime',
    ];
}
