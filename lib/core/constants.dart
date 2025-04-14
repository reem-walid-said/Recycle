import 'package:pair/pair.dart';
import 'package:project/models/category_example_item.dart';

import 'assets.dart';

List<Pair<String, String>> myCategories = [
  Pair("Plastic", Assets.bottle),
  Pair("Can", Assets.can),
  Pair("Glass", Assets.glass),
];

List<CategoryExampleItem> AllItems = [
  CategoryExampleItem(
    category: "Can",
    name: "Coca-Cola Can",
    size: "330ml",
    image: "https://images.unsplash.com/photo-1667204651371-5d4a65b8b5a9",
    description: "Classic Coca-Cola in an aluminum can.",
    recyclable: true,
  ),
  CategoryExampleItem(
    category: "Can",
    name: "Red Bull Can",
    size: "250ml",
    image: "https://media.istockphoto.com/id/458716829/photo/red-bull.jpg?s=612x612&w=0&k=20&c=0CsBVsXdrA7PV1gkUF4VHBkPGh4Vtyq9uNJAMTQObBA=",
    description: "Popular energy drink in a sleek can.",
    recyclable: true,
  ),


  CategoryExampleItem(
    category: "Plastic",
    name: "Plastic Water Bottle",
    size: "500ml",
    image: "https://img.freepik.com/free-photo/photorealistic-water-bottle_23-2151049030.jpg?semt=ais_hybrid&w=740",
    description: "Disposable plastic water bottle.",
    recyclable: true,
  ),
  CategoryExampleItem(
    category: "Plastic",
    name: "Shampoo Bottle",
    size: "400ml",
    image: "https://atlas-content-cdn.pixelsquid.com/stock-images/shampoo-bottle-ZRvq3mA-600.jpg",
    description: "Plastic shampoo bottle with flip cap.",
    recyclable: false,
  ),

  CategoryExampleItem(
    category: "Glass",
    name: "Glass Water Bottle",
    size: "750ml",
    image: "https://glassmania.com/media/catalog/product/cache/2f8a2cbe8eb76902d8836b270861f315/n/m/nmid01b_5.png",
    description: "Eco-friendly glass water bottle.",
    recyclable: true,
  ),
  CategoryExampleItem(
    category: "Glass",
    name: "Glass Jar",
    size: "500ml",
    image: "https://static.vecteezy.com/system/resources/thumbnails/039/327/365/small_2x/ai-generated-empty-glass-jar-isolated-on-transparent-background-png.png",
    description: "Reusable and sealable glass jar.",
    recyclable: true,
  ),

];
