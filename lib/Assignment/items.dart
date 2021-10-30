import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//recommended items
class Recommend {
  String name;
  double newPrice;
  double oldPrice;
  String img;

  Recommend(this.name, this.newPrice, this.oldPrice, this.img);
}

List<Recommend> getItems() {
  return <Recommend>[
    Recommend(
      'Eywa Hoodie',
      30.99,
      44.99,
      "https://images.unsplash.com/photo-1535295972055-1c762f4483e5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGdpcmwlMjBpbiUyMGhvb2RpZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ),
    Recommend(
      'Women Blue Denim Jacket',
      30.00,
      36.00,
      'https://images.unsplash.com/photo-1520423465871-0866049020b7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybCUyMGluJTIwaG9vZGllfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Recommend(
      'Women Sweatshirt',
      32.40,
      38.40,
      'https://images.unsplash.com/photo-1622925492162-98c3760a7080?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGdpcmwlMjBpbiUyMGhvb2RpZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
  ];
}



//category items
class Category {
  String cate;
  String no;
  Icon icon;

  Category(this.cate, this.no, this.icon);
}

List<Category> getCategories() {
  return <Category>[
    Category(
      'Women',
      '728 items',
      Icon(
        Icons.person_outline,
        color: Colors.black,
      ),
    ),
    Category(
      'Men',
      '536 items',
      Icon(
        Icons.person_outline,
        color: Colors.black,
      ),
    ),
    Category(
      'Kids',
      '328 items',
      Icon(
        Icons.person_outline,
        color: Colors.black,
      ),
    ),
  ];
}


//trending and cart items
class Items {
  String name;
  double newPrice;
  double oldPrice;
  String size;
  String img;

  Items(this.name, this.newPrice, this.oldPrice, this.size, this.img);
}

List<Items> getListItems() {
  return <Items>[
    Items(
      'Comfort Shirt',
      50.99,
      60.99,
      'Red - M',
      'https://images.unsplash.com/photo-1517231426114-1ed5cdbe7248?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGJveSUyMGluJTIwdCUyMHNoaXJ0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Items(
      'Russ Shirt',
      19.99,
      25.99,
      'White - L',
      'https://images.unsplash.com/photo-1553859943-a02c5418b798?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGJveSUyMGluJTIwdCUyMHNoaXJ0JTIwcG9ydHJhaXRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Items(
      'Eywa Hoodie',
      30.99,
      44.99,
      'Grey - L',
      "https://images.unsplash.com/photo-1535295972055-1c762f4483e5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGdpcmwlMjBpbiUyMGhvb2RpZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
    ),
    Items(
      'Women Blue Denim Jacket',
      30.00,
      36.00,
      'Blue - M',
      'https://images.unsplash.com/photo-1520423465871-0866049020b7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybCUyMGluJTIwaG9vZGllfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
    Items(
      'Women Sweatshirt',
      32.40,
      38.40,
      'Pink - M',
      'https://images.unsplash.com/photo-1622925492162-98c3760a7080?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGdpcmwlMjBpbiUyMGhvb2RpZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    ),
  ];
}
