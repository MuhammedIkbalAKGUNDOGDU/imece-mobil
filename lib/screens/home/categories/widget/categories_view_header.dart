part of '../categories_screen.dart';

class CategoriesViewHeader extends StatelessWidget
    implements PreferredSizeWidget {
  const CategoriesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(top: 8, left: 10),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: HomeStyle(context: context).secondary,
            )),
      ),
      leadingWidth: 50,
      titleSpacing: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(right: 15, top: 8),
        child: homeTextFieldBar(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10.0);
}
