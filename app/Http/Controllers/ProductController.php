<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class ProductController extends Controller
{
    /**
     * Create a new product.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        try {
            // Validate the request data
            $this->validateProductData($request);

            // Create a new product
            $product = Product::create($request->all());

            // Return the created product with a 201 Created status
            return response()->json($product, Response::HTTP_CREATED);
        } catch (ValidationException $e) {
            // Return a 422 Unprocessable Entity status with validation errors
            return response()->json(['error' => $e->validator->errors()], Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (\Exception $e) {
            // Log the error and return a 500 Internal Server Error response
            Log::error("Error creating product. Message: {$e->getMessage()}");
            return response()->json(['error' => 'Error creating product.'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Validate the request data for creating a product.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return void
     * @throws \Illuminate\Validation\ValidationException
     */
    private function validateProductData(Request $request)
    {
        $request->validate(
            [
                'name' => 'required|string|max:255',
                'description' => 'required|string',
                'price' => 'required|numeric',
                'category' => 'required|string|max:255',
                'stock' => 'required|integer|min:0',
            ],
            [
                'required' => 'The :attribute field is required.',
                'numeric' => 'The :attribute must be a number.',
                'min' => 'The :attribute must be at least :min.',
                'string' => 'The :attribute must be a string.',
                'max' => 'The :attribute must not exceed :max characters.',
                'alpha_num' => 'The :attribute must be alphanumeric.',
            ]
        );
    }

    /**
     * Retrieve all products.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        try {
            // Retrieve all products
            $products = Product::all();

            // Return the products with a 200 OK status
            return response()->json($products, Response::HTTP_OK);
        } catch (\Exception $e) {
            // Log the error and return a 500 Internal Server Error response
            Log::error("Error retrieving products. Message: {$e->getMessage()}");
            return response()->json(['error' => 'Error retrieving products.'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Retrieve a specific product by ID.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        try {
            // Find the product by ID
            $product = Product::findOrFail($id);

            // Return the product with a 200 OK status
            return response()->json($product, Response::HTTP_OK);
        } catch (ModelNotFoundException $e) {
            // Log the error and return a 404 Not Found response
            Log::error("Product not found. ID: $id");
            return response()->json(['error' => 'Product not found.'], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            // Log the error and return a 500 Internal Server Error response
            Log::error("Error retrieving product. ID: $id. Message: {$e->getMessage()}");
            return response()->json(['error' => 'Error retrieving product.'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Update a product.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        try {
            // Validate the request data
            $this->validateProductData($request);

            // Find the product by ID
            $product = Product::findOrFail($id);

            // Update the product with the new data
            $product->update($request->all());

            // Return the updated product with a 200 OK status
            return response()->json($product, Response::HTTP_OK);
        } catch (ValidationException $e) {
            // Return a 422 Unprocessable Entity status with validation errors
            return response()->json(['error' => $e->validator->errors()], Response::HTTP_UNPROCESSABLE_ENTITY);
        } catch (ModelNotFoundException $e) {
            // Log the error and return a 404 Not Found response
            Log::error("Product not found for update. ID: $id");
            return response()->json(['error' => 'Product not found.'], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            // Log the error and return a 500 Internal Server Error response
            Log::error("Error updating product. ID: $id. Message: {$e->getMessage()}");
            return response()->json(['error' => 'Error updating product.'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Delete a product.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        try {
            // Find the product by ID
            $product = Product::findOrFail($id);

            // Delete the product
            $product->delete();

            // Return a success message with a 200 OK status
            return response()->json(['message' => 'Product deleted successfully.'], Response::HTTP_OK);
        } catch (ModelNotFoundException $e) {
            // Log the error and return a 404 Not Found response
            Log::error("Product not found for deletion. ID: $id");
            return response()->json(['error' => 'Product not found.'], Response::HTTP_NOT_FOUND);
        } catch (\Exception $e) {
            // Log the error and return a 500 Internal Server Error response
            Log::error("Error deleting product. ID: $id. Message: {$e->getMessage()}");
            return response()->json(['error' => 'Error deleting product.'], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
