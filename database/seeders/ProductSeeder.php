<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Product; 

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Array of product data to be inserted into the products table
        $products = [
            [
                "name" => "Powerful Blender",
                "description" => "High-performance blender for smoothies and food preparation.",
                "price" => 89.99,
                "category" => "Kitchen Appliances",
                "stock" => 50
            ],
            [
                "name" => "Coffee Maker",
                "description" => "Automatic coffee maker for brewing your favorite coffee at home.",
                "price" => 49.99,
                "category" => "Appliances",
                "stock" => 30
            ],
            [
                "name" => "Bluetooth Speaker",
                "description" => "Portable speaker with wireless connectivity for music on the go.",
                "price" => 59.99,
                "category" => "Electronics",
                "stock" => 20
            ],
            [
                "name" => "Smartphone",
                "description" => "High-end smartphone with a powerful camera and advanced features.",
                "price" => 799.99,
                "category" => "Electronics",
                "stock" => 15
            ],
            [
                "name" => "Laptop",
                "description" => "Thin and lightweight laptop with a fast processor and long battery life.",
                "price" => 1299.99,
                "category" => "Electronics",
                "stock" => 10
            ],
            [
                "name" => "Fitness Tracker",
                "description" => "Wearable fitness tracker to monitor your daily activities and health.",
                "price" => 79.99,
                "category" => "Wearables",
                "stock" => 25
            ],
            [
                "name" => "Gaming Mouse",
                "description" => "High-precision gaming mouse with customizable buttons and RGB lighting.",
                "price" => 49.99,
                "category" => "Gaming Accessories",
                "stock" => 40
            ],
            [
                "name" => "Durable Backpack",
                "description" => "Spacious backpack with multiple compartments for daily use or travel.",
                "price" => 39.99,
                "category" => "Fashion",
                "stock" => 30
            ],
            [
                "name" => "Digital Camera",
                "description" => "Mirrorless digital camera with 4K video recording and interchangeable lenses.",
                "price" => 899.99,
                "category" => "Photography",
                "stock" => 12
            ],
            [
                "name" => "Wireless Earbuds",
                "description" => "True wireless earbuds with noise cancellation and long battery life.",
                "price" => 129.99,
                "category" => "Audio",
                "stock" => 18
            ]
        ];

        // Loop through each product and create a new record in the products table
        foreach ($products as $productData) {
            Product::create($productData);
        }
    }
}
