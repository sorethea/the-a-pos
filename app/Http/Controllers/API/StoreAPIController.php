<?php

namespace App\Http\Controllers\API;

use App\Http\Requests\API\CreateStoreAPIRequest;
use App\Http\Requests\API\UpdateStoreAPIRequest;
use App\Http\Resources\StoreCollection;
use App\Http\Resources\StoreResource;
use App\Models\Store;
use App\Repositories\StoreRepository;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\AppBaseController;

/**
 * Class StoreAPIController
 */
class StoreAPIController extends AppBaseController
{
    private StoreRepository $storeRepository;

    public function __construct(StoreRepository $storeRepo)
    {
        $this->storeRepository = $storeRepo;
    }

    public function index(Request $request): StoreCollection
    {
        $perPage = getPageSize($request);
        $stores = $this->storeRepository->paginate($perPage);
        StoreResource::usingWithCollection();

        return new StoreCollection($stores);
    }
    /**
     * Store a newly created Store in storage.
     * POST /stores
     */
    public function store(CreateStoreAPIRequest $request): StoreResource
    {
        $input = $request->all();

        $store = $this->storeRepository->create($input);

        return new StoreResource($store);
    }
    /**
     * Display the specified Store.
     * GET|HEAD /stores/{id}
     */
    public function show($id): StoreResource
    {
        /** @var Store $store */
        $store = $this->storeRepository->find($id);

        return new StoreResource($store);
    }

    /**
     * Update the specified Store in storage.
     * PUT/PATCH /stores/{id}
     */
    public function update(UpdateStoreAPIRequest $request,$id): StoreResource
    {
        $input = $request->all();

        $store = $this->storeRepository->update($input, $id);

        return new StoreResource($store);
    }

    /**
     * Remove the specified Store from storage.
     * DELETE /stores/{id}
     *
     * @throws \Exception
     */
    public function destroy($id): JsonResponse
    {
        /** @var Store $store */
        $store = $this->storeRepository->find($id);

        if (empty($store)) {
            return $this->sendError('Store not found');
        }

        $store->delete();

        return $this->sendSuccess('Store deleted successfully');
    }
}
