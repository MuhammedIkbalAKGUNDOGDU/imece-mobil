part of '../cart_screen.dart';

PreferredSize _CartScreenHeader(BuildContext context) {
  return PreferredSize(
    preferredSize:
        MediaQuery.sizeOf(context) * 0.08, // AppBar yüksekliği 100 piksel
    child: AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.grey,
      elevation: 4,
      leadingWidth: MediaQuery.of(context).size.width * 0.07,
      title: Container(
        padding: EdgeInsets.only(top: 10),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBarHeaderText('Sepetim'),
            _appBarBodyText('ve Ödeme Seçenekleri'),
          ],
        ),
      ),
    ),
  );
}
