<?php

namespace App\Models;

use App\Traits\HasJsonResourcefulData;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Store extends BaseModel
{

    use HasFactory, HasJsonResourcefulData;

    public $table = 'stores';

    const JSON_API_TYPE = 'stores';

    public $fillable = [
        'name',
        'phone',
        'address',
        'location',
        'description',
        'created_at'
    ];

    protected $casts = [
        'name' => 'string',
        'phone' => 'string',
        'address' => 'string',
        'location' => 'string',
        'description' => 'string'
    ];

    public static array $rules = [
        'name' => 'required|unique:stores',
        'phone' => 'required|numeric',
        'address' => 'required',
        'location' => 'required',
        'description' => 'nullable'
    ];


    public function prepareLinks(): array
    {
        return [
            'self' => route('stores.show', $this->id),
        ];
    }

    public function prepareAttributes(): array
    {
        $fields = [
            'name' => $this->name,
            'phone' => $this->phone,
            'address' => $this->address,
            'location' => $this->location,
            'created_at' => $this->created_at,
        ];
        return $fields;
    }
}
