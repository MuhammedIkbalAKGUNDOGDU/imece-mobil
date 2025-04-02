part of '../wallet_screen.dart';

AppBar _WalletViewHeader(BuildContext context) {
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
          ))
    ],
  );
}
