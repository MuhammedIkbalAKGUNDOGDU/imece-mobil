import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/home_screen_mixin.dart';
import 'package:imecehub/screens/home/manager/home_manager.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/screens/order/order_screen.dart';
import 'package:imecehub/screens/profil/addPost/addPost_screen.dart';

part 'widget/home_view_header.dart';
part 'widget/home_view_bottom.dart';
part 'widget/home_view_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeScreenMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _HomeHeaderAppBar(),
      body: _HomeViewBody(),
      bottomNavigationBar: _HomeBottomNavigationBar(),
    );
  }
}

extension _HomeStyleExtension on BuildContext {
  HomeStyle get homeStyle => HomeStyle(context: this);
  HomeManager get homeManager => HomeManager(context: this);
}
