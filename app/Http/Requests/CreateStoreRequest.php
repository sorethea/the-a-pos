<?php

namespace App\Http\Requests;

use App\Models\Store;
use App\Models\Warehouse;
use Illuminate\Foundation\Http\FormRequest;

/**
 * Class CreateWarehouseRequest
 */
class CreateStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return Store::$rules;
    }
}
