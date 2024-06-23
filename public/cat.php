// <?php
 
//  $servername = "localhost";
// $username = "shop_sarorcab_db";
// $password = "plQeKBtDfB5xTL49";
// $dbname = "shop_sarorcab_db";

// // Create connection
// $conn = new mysqli($servername, $username, $password, $dbname);

// // Check connection
// if ($conn->connect_error) {
//     die("Connection failed: " . $conn->connect_error);
// }

// $categories = [
//     # Car Accessories
//     ["name"=> "Car Accessories", "module_id"=> 9, "parent_id"=> 0],
//     ["name"=> "Car Parts", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Audio", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Care", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Electronics", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Interior Accessories", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Exterior Accessories", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Tools & Equipment", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Tires & Wheels", "module_id"=> 9, "parent_id"=> 1],
//     ["name"=> "Car Performance Parts", "module_id"=> 9, "parent_id"=> 1],

//     # Sweets
//     ["name"=> "Sweets", "module_id"=> 8, "parent_id"=> 0],
//     ["name"=> "Chocolate", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Candy", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Gummies", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Hard Candy", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Lollipops", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Mints", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Gum", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Licorice", "module_id"=> 8, "parent_id"=> 2],
//     ["name"=> "Marshmallows", "module_id"=> 8, "parent_id"=> 2],

//     # Smartphones
//     ["name"=> "Smartphones", "module_id"=> 7, "parent_id"=> 0],
//     ["name"=> "Android", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "iOS", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "Windows Phone", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "BlackBerry", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "Smartphone Accessories", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "Phone Cases", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "Screen Protectors", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "Chargers & Cables", "module_id"=> 7, "parent_id"=> 3],
//     ["name"=> "Headsets & Earphones", "module_id"=> 7, "parent_id"=> 3],

//     # Women's Clothing
//     ["name"=> "Women's Clothing", "module_id"=> 6, "parent_id"=> 0],
//     ["name"=> "Dresses", "module_id"=> 6, "parent_id"=> 4],
//     ["name"=> "Tops & Tees", "module_id"=> 6, "parent_id"=> 4],
//     ["name"=> "Sweaters", "module_id"=> 6, "parent_id"=> 4],
//     ["name"=> "Jackets & Coats", "module_id"=> 6, "parent_id"=> 4],
//     ["name"=> "Pants & Leggings", "module_id"=> 6, "parent_id"=> 4],
//     ["name"=> "Skirts", "module_id"=> 6, "parent_id"=> "Women's Clothing"],
//     ["name"=> "Jumpsuits & Rompers", "module_id"=> 6, "parent_id"=> 4],
//     ["name"=> "Swimwear", "module_id"=> 6, "parent_id"=> "Women's Clothing"],
//     ["name"=> "Lingerie & Sleepwear", "module_id"=> 6, "parent_id"=> 4],

//     # Ecommerce
//     ["name"=> "Ecommerce", "module_id"=> 3, "parent_id"=> 0],
//     ["name"=> "Online Stores", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Marketplaces", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Payment Gateways", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Shipping & Logistics", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Ecommerce Platforms", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Ecommerce Tools", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Ecommerce Marketing", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Ecommerce Analytics", "module_id"=> 3, "parent_id"=> 5],
//     ["name"=> "Ecommerce Security", "module_id"=> 3, "parent_id"=> 5],

//     # Pharmacy
//     ["name"=> "Pharmacy", "module_id"=> 2, "parent_id"=> 0],
//     ["name"=> "Medicines", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "Vitamins & Supplements", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "Personal Care", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "Health Devices", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "First Aid", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "Skin Care", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "Hair Care", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "Oral Care", "module_id"=> 2, "parent_id"=> 6],
//     ["name"=> "Eye Care", "module_id"=> 2, "parent_id"=> 6],

//     # Restaurants
//     ["name"=> "Restaurants", "module_id"=> 4, "parent_id"=> 0],
//     ["name"=> "Fast Food", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Pizza", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Chinese", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Indian", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Italian", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Mexican", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Thai", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Japanese", "module_id"=> 4, "parent_id"=> 7],
//     ["name"=> "Bakery", "module_id"=> 4, "parent_id"=> 7],

//     # Grocery
//     ["name"=> "Grocery", "module_id"=> 1, "parent_id"=> 0],
//     ["name"=> "Fruits", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Vegetables", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Meat & Seafood", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Dairy & Eggs", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Bakery", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Frozen Foods", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Pantry Staples", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Snacks", "module_id"=> 1, "parent_id"=> 8],
//     ["name"=> "Beverages", "module_id"=> 1, "parent_id"=> 8],
// ];

// $parent_ids = [];

// foreach ($categories as $category) {
//     $parent_id = isset($parent_ids[$category["parent_id"]]) ? $parent_ids[$category["parent_id"]] : "NULL";
//     $position = $category["parent_id"] === NULL ? 0 : 1;
//     $status = 1;

//     $sql = "INSERT INTO categories (name, image, parent_id, position, module_id, status) VALUES ('{$category['name']}', 'default.png', {$category['parent_id']}, {$position}, {$category['module_id']}, {$status})";

//     if ($conn->query($sql) === TRUE) {
//         $last_id = $conn->insert_id;
//         echo "New record created successfully. Last inserted ID is: " . $last_id . "\n";

//         if ($category["parent_id"] === NULL) {
//             $parent_ids[$category["name"]] = $last_id;
//         }
//     } else {
//         echo "Error: " . $sql . "<br>" . $conn->error . "\n";
//     }
// }

// $conn->close();
// ?>