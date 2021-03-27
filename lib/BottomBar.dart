import 'package:Food_app/Deals.dart';
import 'package:Food_app/Order.dart';
import 'package:Food_app/RecentOrders.dart';
import 'package:Food_app/home.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    Home(),
    Order(),
    Deals(),
    RecentOrders(),
  ];
  Widget currentScreen = Home();
  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
        ),
        backgroundColor: Color.fromRGBO(255, 209, 85, 1),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                          () {
                            currentScreen = Home();
                            currentTab = 0;
                          },
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.home_outlined,
                              color: currentTab == 0
                                  ? Color.fromRGBO(255, 209, 85, 1)
                                  : Colors.grey),
                          Text(
                            'Home',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Color.fromRGBO(255, 209, 85, 1)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                          () {
                            currentScreen = Order();
                            currentTab = 1;
                          },
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.food_bank_outlined,
                              color: currentTab == 1
                                  ? Color.fromRGBO(255, 209, 85, 1)
                                  : Colors.grey),
                          Text(
                            'Order',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Color.fromRGBO(255, 209, 85, 1)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                          () {
                            currentScreen = Deals();
                            currentTab = 2;
                          },
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.money_outlined,
                              color: currentTab == 2
                                  ? Color.fromRGBO(255, 209, 85, 1)
                                  : Colors.grey),
                          Text(
                            'Deals',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? Color.fromRGBO(255, 209, 85, 1)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(
                          () {
                            currentScreen = RecentOrders();
                            currentTab = 3;
                          },
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Icon(Icons.recent_actors_outlined,
                              color: currentTab == 3
                                  ? Color.fromRGBO(255, 209, 85, 1)
                                  : Colors.grey),
                          Text(
                            'Recent',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? Color.fromRGBO(255, 209, 85, 1)
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
