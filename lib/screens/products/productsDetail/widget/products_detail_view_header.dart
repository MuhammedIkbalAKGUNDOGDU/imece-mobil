part of '../products_detail_screen.dart';

AppBar _productsDetailAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(height: 42, child: homeTextFieldBar(context)),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            shopIconButton(context),
            settingsIconButton(context),
          ],
        ),
      ),
    ],
  );
}
