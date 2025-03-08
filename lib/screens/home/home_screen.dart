import 'package:flutter/material.dart';
import 'package:imecehub/screens/order/order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OrderScreen()));
            },
            icon: Icon(Icons.shopping_bag_outlined)),
      ]),
    );
  }
}
