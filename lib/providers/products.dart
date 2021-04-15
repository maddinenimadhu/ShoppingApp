import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trimmers',
      description: 'mens trimmer.',
      price: 999.00,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLuW4pnnlEQlEZBSxbvdCZnRYPHBXJTGCEiJ0oX0Iyun1tqVzuKscLzeXDqVtJEDF4uj99saM&usqp=CAc',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Shoes',
      description: 'Any shoes you want.',
      price: 399.0,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRy8DEJ_GvE9wSB5J0TMJs7gFW3hcEg3T271A3gnKSbvE_Sj9fmssZf0Oc2A&usqp=CAc',
    ),
    Product(
      id: 'p6',
      title: 'shirts',
      description: 'Any shirts select you want.',
      price: 499.0,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4WBq-iRnIG1TrTuiTpiA7hf08iJZKAWqvRPe9DDimRM21vZwyGgB8pbzBrUmtGLCLb4JuBKI&usqp=CAc',
    ),
    Product(
      id: 'p7',
      title: 'spectacles for men',
      description: 'Eye protecter.',
      price: 19.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF53vfdwNMVXIJ9eHwMoHbJ_hO7QzwRAi1rbN3bOLwQMTREzzqu8X41B13uw190ANRtAD_8H4&usqp=CAc',
    ),
    Product(
      id: 'p8',
      title: 'Iphone',
      description: 'Mobile.',
      price: 59999.00,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_UE0xPwz-uvxohXFfCl31luxQIc55cew5XDNgCnOnngph0OpbKkfp-iRyVBWOC8tcDgXMP4Y&usqp=CAc',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    // _items.insert(0, newProduct); // at the start of the list
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
