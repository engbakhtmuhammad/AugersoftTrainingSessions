import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_crud/Assignment/Screens/screen3.dart';
import 'package:flutter/material.dart';
import '../items.dart';

class Details extends StatefulWidget {
  const Details({ Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int current = 0;
  int index = 1;
  int indexSize = 2;
  final CarouselController _controller = CarouselController();
  List<Color> color = [
    Colors.white,
    Colors.grey,
    Colors.black,
    Colors.blue,
  ];

  List<String> sizeList = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Widget> imgSliders =
        getItems().map((item) => mapCarouselItems(item, size)).toList();

    return Scaffold(
      backgroundColor: Color(0xffe9ebf7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                carousel(imgSliders, context),
                Positioned(
                  top: 45,
                  left: 15,
                  right: 15,
                  child: iconsRow(context),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                children: [
                  for (int i = 0; i < getItems().length; i++)
                    if (current == i)
                      Container(
                        width: size.width * 0.9,
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getItems()[i].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '\$${getItems()[i].newPrice}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    '\$${getItems()[i].oldPrice}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                ],
              ),
            ),
            colorRow(size),
            sizeRow(size),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  //
                },
                child: Container(
                  width: size.width * 0.9,
                  height: 50,
                  child: Center(
                      child: Text(
                    'Add to Cart',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding sizeRow(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Container(
        width: size.width * 0.9,
        height: 25,
        color: Colors.indigo[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < sizeList.length; i++)
              InkWell(
                onTap: () {
                  setState(() {
                    indexSize = i;
                  });
                },
                child: Container(
                  width: 28,
                  height: 45,
                  color: indexSize == i ? Colors.blue : Colors.transparent,
                  child: Center(
                      child: Text(
                    sizeList[i],
                    style: TextStyle(
                        color:
                            indexSize == i ? Colors.white : Colors.grey[600]),
                  )),
                ),
              )
          ],
        ),
      ),
    );
  }

  Padding colorRow(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        width: size.width,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Color",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            Container(
              width: size.width * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < color.length; i++)
                    Stack(
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  index == i ? Colors.blue : Colors.transparent,
                              width: 2,
                            ),
                            color:
                                index == i ? Colors.white : Colors.transparent,
                          ),
                        ),
                        Positioned(
                          top: 4,
                          bottom: 4,
                          left: 4,
                          right: 4,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                index = i;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color[i],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container iconsRow(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
            child: Stack(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                Positioned(
                  right: 2,
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container mapCarouselItems(Recommend item, Size size) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Stack(
            children: <Widget>[
              Image.network(
                item.img,
                fit: BoxFit.cover,
                height: 550,
                width: size.width,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(150, 0, 0, 0),
                        Color.fromARGB(100, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: getItems().asMap().entries.map((index) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(index.key),
                        child: Container(
                          width: current == index.key ? 10.0 : 6.0,
                          height: current == index.key ? 10.0 : 6.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 6.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (current == index.key
                                  ? Colors.white
                                  : Colors.white30)),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Container carousel(List<Widget> imgSliders, BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imgSliders,
        carouselController: _controller,
        options: CarouselOptions(
            height: 550,
            initialPage: 0,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                current = index;
              });
            }),
      ),
    );
  }
}
