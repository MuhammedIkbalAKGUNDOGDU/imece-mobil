import 'package:flutter/material.dart';
import 'package:imecehub/screens/home/home_screen.dart';
import 'package:imecehub/screens/profil/addPost/addPost_screen.dart';

mixin HomeScreenMixin on State<HomeScreen> {
  late List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    AddPost(),
  ];
}
