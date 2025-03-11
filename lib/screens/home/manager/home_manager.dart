import 'package:flutter/material.dart';
import 'package:imecehub/screens/home/home_screen.dart';
import 'package:imecehub/screens/profil/addPost/addPost_screen.dart';

abstract class ManagerInterface {
  void showError();
  void homeScreen(int index);
}

final class HomeManager implements ManagerInterface {
  HomeManager({required BuildContext context}) : _context = context;

  final BuildContext _context;

  @override
  void showError() {
    ScaffoldMessenger.of(_context).showSnackBar(
      const SnackBar(
        content: Text('Error'),
      ),
    );
  }

  @override
  void homeScreen(int index) {
    switch (index) {
      case 0:
        HomeScreen();
      case 1:
        HomeScreen();
      case 2:
        HomeScreen();
      case 3:
        HomeScreen();
      default:
        Navigator.pushNamed(
          _context,
          '/test',
        );
    }
  }
}
