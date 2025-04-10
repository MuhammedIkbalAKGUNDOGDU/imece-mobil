part of '../seller_profil_screen.dart';

class ShortcutCenter extends StatefulWidget {
  final User user;

  const ShortcutCenter({super.key, required this.user});

  @override
  _ShortcutCenterState createState() => _ShortcutCenterState();
}

class _ShortcutCenterState extends State<ShortcutCenter> {
  int selectedIndex = 0;
  Offset position = const Offset(1, 1);
  bool _expanded = false;

  List<Widget> get _menuItems => [
        _fastCenterButtons(
          'Ürün Ekle',
          Icon(Icons.add_shopping_cart),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/profil/addProduct',
              arguments: widget.user,
            );
          },
        ),
        _fastCenterButtons(
          'Gönderi Ekle',
          Icon(Icons.photo_filter_rounded),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/profil/addPost',
              arguments: widget.user,
            );
          },
        ),
        _fastCenterButtons(
          'Cüzdan',
          Icon(Icons.wallet_rounded),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/profil/wallet',
              arguments: widget.user,
            );
          },
        ),
      ];

  GestureDetector _fastCenterButtons(String text, Icon icon,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 78, // Butonların genişliğini sabitlemek, düzeni sağlar.
        child: Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              customText(text, context,
                  size: HomeStyle(context: context).bodySmall.fontSize,
                  weight: FontWeight.w300),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = HomeStyle(context: context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double containerWidth =
        screenWidth * 0.6; // Menü container'ının istenen genişliği
    final double containerHeight = 70; // Sabit yükseklik

    // Ana butonun sağında menü başlatılıyor:
    double proposedLeft = position.dx + 60;
    double proposedTop = position.dy;

    // İzin verilen maksimum overflow: container'ın yarısı kadar.
    // Yani menü, ekranın solundan en fazla containerWidth/2 kadar dışarı çıkabilir.
    double minLeft = -containerWidth / 2;
    double maxLeft = screenWidth - containerWidth / 2;

    // Aynı şekilde dikeyde:
    double minTop = -containerHeight / 2;
    double maxTop = screenHeight - containerHeight / 2;

    // Eğer proposedLeft veya proposedTop sınırları aşıyorsa ayarla:
    double menuLeft = proposedLeft.clamp(minLeft, maxLeft) as double;
    double menuTop = proposedTop.clamp(minTop, maxTop) as double;

    return SizedBox.expand(
      child: Stack(
        children: [
          // Diğer ekran içerikleri burada yer alabilir.

          // Eğer _expanded true ise, butonun sağında açılan menü
          if (_expanded)
            Positioned(
              left: menuLeft,
              top: menuTop,
              child: container(
                context,
                height: containerHeight,
                width: containerWidth,
                color: themeData.surfaceContainer.withOpacity(0.7),
                isBoxShadow: false,
                borderRadius: BorderRadius.circular(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: _menuItems
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.all(0),
                            child: item,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),

          // Taşınabilir yuvarlak buton
          Positioned(
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  position += details.delta;
                });
              },
              onTap: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
