part of '../add_product_screen.dart';

class AddProductViewHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final User profileName;

  const AddProductViewHeader(
      {super.key, required this.profileName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close_outlined,
              size: 30,
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
