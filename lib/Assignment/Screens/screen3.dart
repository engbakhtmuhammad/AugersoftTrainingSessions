import 'package:flutter/material.dart';

import '../items.dart';

class Cart extends StatelessWidget {
   Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.separated(
        itemCount: getListItems().length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (BuildContext ctxt, int index) {
          return listTiles(index);
        },
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total"),
                  Text(
                    "\$127.60",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              // ignore: deprecated_member_use
              RaisedButton(
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
            ],
          ),
        ),
      ),
    );
  }

  Padding listTiles(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.1,
        child: ListTile(
          isThreeLine: true,
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 70,
              minHeight: 70,
              maxWidth: 70,
              maxHeight: 70,
            ),
            child: Image.network(
              getListItems()[index].img,
              // width: 100,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            getListItems()[index].name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(getListItems()[index].size),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${getListItems()[index].newPrice}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  Container(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
