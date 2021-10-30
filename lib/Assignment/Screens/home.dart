
import 'package:carousel_slider/carousel_controller.dart';
import 'package:firebase_crud/Assignment/Carousel/carousel.dart';
import 'package:firebase_crud/Assignment/Carousel/mapCarousel.dart';
import 'package:firebase_crud/Assignment/Screens/screen2.dart';
import 'package:flutter/material.dart';
import '../items.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _controller = CarouselController();
  bool searchState = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Widget> imgSliders =
        getItems().map((item) => MapCarousel(item: item, size: size)).toList();

    return Scaffold(
      backgroundColor: Color(0xffe9ebf7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //slider
            Stack(
              children: [
                MyCarouselSlider(
                    imgSliders: imgSliders,
                    context: context,
                    controller: _controller),
                searchBar(size),
              ],
            ),

            //trending image row
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Show all",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            //image row
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < getListItems().length; i++)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()));
                        },
                        child: Container(
                          height: size.width * 0.4,
                          width: size.width * 0.35,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: cardRow(size, i),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            //categories list
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Show all",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),

            //categories list
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: categoryTiles())
          ],
        ),
      ),
    );
  }

  Column categoryTiles() {
    return Column(
      children: [
        for (int i = 0; i < getCategories().length; i++)
          Card(
            elevation: 0,
            child: ListTile(
              leading: getCategories()[i].icon,
              title: Row(
                children: [
                  Text(
                    getCategories()[i].cate,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '(${getCategories()[i].no})',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              trailing: Icon(
                Icons.chevron_right_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
          )
      ],
    );
  }

  Card cardRow(Size size, int i) {
    return Card(
      shadowColor: Colors.grey[50],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Container(
              child: Image.network(
                getListItems()[i].img,
                fit: BoxFit.cover,
                width: size.width * 0.35,
                height: size.width * 0.2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Container(
              width: size.width * 0.35,
              child: Text(
                getListItems()[i].name,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Container(
              width: size.width * 0.35,
              child: Row(
                children: [
                  Text(
                    '\$${getListItems()[i].newPrice}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '\$${getListItems()[i].oldPrice}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding searchBar(Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 60, 12, 0),
      child: InkWell(
        onTap: () {
          setState(() {
            searchState = !searchState;
          });
        },
        child: Container(
          width: size.width,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(
                  !searchState ? Icons.search : Icons.arrow_back_ios,
                  color: Colors.white54,
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: !searchState
                      ? Text(
                          'What are you looking for?',
                          style: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : Container(
                          width: size.width * 0.8,
                          child: TextField(
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: "Search ...",
                              hintStyle: TextStyle(color: Colors.grey[700]),
                            ),
                            onChanged: (text) {
                              ///
                            },
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
