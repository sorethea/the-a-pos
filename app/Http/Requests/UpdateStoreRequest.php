<?php

namespace App\Http\Requests;

use App\Models\Store;
use App\Models\Warehouse;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class UpdateWarehouseRequest
 */
class UpdateStoreRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    /**
     * @return string[]
     */
    public function rules(): array
    {
        $rules = Store::$rules;
        $rules['name'] = 'required|unique:store,name,'.$this->route('store');

        return $rules;
    }
}
