import 'package:flutter/material.dart';
import '../items.dart';

class MapCarousel extends StatefulWidget {
  const MapCarousel({Key? key, required this.item, required this.size}) : super(key: key);
  final Recommend item;
  final Size size;

  @override
  _MapCarouselState createState() => _MapCarouselState();
}

class _MapCarouselState extends State<MapCarousel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Stack(
            children: <Widget>[
              Image.network(
                widget.item.img,
                fit: BoxFit.cover,
                height: 500,
                width: widget.size.width,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Recommendations',
                          style: TextStyle(
                              color: Colors.white60,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          widget.item.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '\$${widget.item.newPrice}',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                '\$${widget.item.oldPrice}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
