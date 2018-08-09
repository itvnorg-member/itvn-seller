<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'group_customer_id', 'name', 'code', 'city_id', 'email', 'address', 'phone', 'active', 'order'
    ];

    /**
     * A customer can have many carts.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function carts() {

        return $this->hasMany('App\Models\Cart');
    }

    /**
     * A product detail can have many sizes.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function city() {

        return $this->hasOne('App\Models\City', 'id', 'city_id');
    }

    /**
     * Get the brand that owns the product.
     */
    public function groupCustomer()
    {
        return $this->belongsTo('App\Models\GroupCustomer');
    }
}
