import 'package:flutter/material.dart';
import 'package:test_app1/models/order.dart';
import 'package:test_app1/pages/map.dart';
import 'package:test_app1/pages/order.dart';
import 'package:test_app1/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<Order> orders = [];

  Widget buildOrderList(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text('xxxx'));
      },
    );
  }

  void addOrder(Order newOrder) {
    setState(() {
      orders.add(newOrder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapPage()),
                ),
          )
        ],
      ),
      body: buildOrderList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OrderPage(addOrder)));
        },
      ),
    );
  }
}
