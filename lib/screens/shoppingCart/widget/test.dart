part of '../cart_screen.dart';

Widget bottomAppBar(BuildContext context) {
  bool _confirm = false;
  return Column(
    spacing: 10,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Row(
          children: [
            Text(
              "Satın alım koşullarını onaylıyorum",
              style: TextStyle(fontSize: 15),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                side: BorderSide(
                  color:
                      Color.fromARGB(255, 34, 255, 34), // Dış çizginin rengi
                  width: 2, // Dış çizginin kalınlığı
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      4), // Köşeleri yuvarlak yapmak için
                ),
  
                value: _confirm,
                onChanged: (bool? newValue) {
                  _confirm = newValue ?? false;
                },
                activeColor:
                    Color.fromARGB(255, 34, 255, 34), // Seçildiğinde rengi
              ),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  'Total Ücret:',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                ),
                Text(
                  '360 TL',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Satın Al',
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: WidgetStateProperty.all<Color>(
                      Color.fromARGB(255, 34, 255, 34)), // Arka plan rengi
                  foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.white), // Yazı rengi),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Köşeleri yuvarlat
                    ),
                  ),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10), // Buton iç boşluğu
                  ),
                ))
          ],
        ),
      )
    ],
  );
}
