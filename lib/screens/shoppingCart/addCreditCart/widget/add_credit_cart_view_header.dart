part of '../add_credit_cart.dart';

AppBar _AddCreditCartAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(10.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: HomeStyle(context: context).secondary,
            ),
            label: customText('Geri Dön', context,
                weight: FontWeight.w600,
                size: 18,
                color: HomeStyle(context: context).secondary)),
      ),
    ),
  );
}
