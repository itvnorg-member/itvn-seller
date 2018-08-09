<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'code', 'city_id', 'quantity', 'partner_discount_amount', 'customer_discount_amount',
        'total_discount_amount', 'transport_id', 'customer_id', 'partner_id', 'price',
        'total_price', 'shipping_fee', 'vat_percent', 'vat_amount', 'prepaid_amount',
        'needed_paid', 'descritption', 'payment_status', 'status', 'active', 'order'
    ];

    /**
     * Get the customer that owns the cart.
     */
    public function customer()
    {
        return $this->belongsTo('App\Models\Customer');
    }

    /**
     * Get the provider that owns the cart.
     */
    public function provider()
    {
        return $this->belongsTo('App\Models\Provider');
    }

    /**
     * A product can have many photos.
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function details() {

        return $this->hasMany('App\Models\CartDetail');
    }
}