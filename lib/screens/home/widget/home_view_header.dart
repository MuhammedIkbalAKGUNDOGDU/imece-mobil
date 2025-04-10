part of '../home_screen.dart';

class HomeHeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: HomeStyle(context: context).surface,
      title: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: homeTextFieldBar(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 5.0);
}
