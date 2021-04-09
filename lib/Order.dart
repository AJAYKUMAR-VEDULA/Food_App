import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List menuWallData = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/MenuWall.json');
    final data = await json.decode(response);
    setState(() {
      menuWallData = data['menuWallData'];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Order',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              fontSize: 30),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: menuWallData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 0.0, left: 10.0, right: 10.0),
            child: Card(
              elevation: 0,
              color: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height / 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-3, 3),
                          blurRadius: 10,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              menuWallData[index]['categoryName'],
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            menuWallData[index]['categoryDescription'],
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Grand Price : ${menuWallData[index]['categoryBestPrice']}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 0,
                    height: size.height / 9,
                    child: Image(
                        image: AssetImage(
                            'assets/${menuWallData[index]['categoryImage']}')),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
