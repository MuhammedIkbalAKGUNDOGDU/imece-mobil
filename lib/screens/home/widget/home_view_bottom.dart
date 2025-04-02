part of '../home_screen.dart';

class _HomeBottomNavigationBarTest extends StatelessWidget {
  int selectedIndex;
  final ValueChanged<int> onPressed;
  _HomeBottomNavigationBarTest(
      {super.key, required this.onPressed, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: HomeStyle(context: context).bottomNavigationBarPadding,
        child: ClipRRect(
          borderRadius:
              HomeStyle(context: context).bottomNavigationBarBorderRadius,
          child: BottomNavigationBar(
            backgroundColor: HomeStyle(context: context).surfaceContainer,
            selectedItemColor: HomeStyle(context: context).secondary,
            unselectedItemColor: HomeStyle(context: context).primary,
            selectedLabelStyle: TextStyle(
              color: HomeStyle(context: context).secondary,
            ),
            unselectedLabelStyle: TextStyle(
              color: HomeStyle(context: context).primary,
            ),
            currentIndex: selectedIndex,
            items: [
              _buildBottomNavigationBarItem(
                context,
                'Anasayfa',
                'assets/vectors/homePage.svg',
                0,
              ),
              _buildBottomNavigationBarItem(
                context,
                'Ürünler',
                'assets/vectors/urunler.svg',
                1,
              ),
              _buildBottomNavigationBarItem(
                context,
                'Sepetim',
                'assets/vectors/sepet.svg',
                2,
              ),
              _buildBottomNavigationBarItem(
                context,
                'Profilim',
                'assets/vectors/profil.svg',
                3,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            onTap: onPressed,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      BuildContext context, String label, String iconPath, int index) {
    final color = selectedIndex == index
        ? HomeStyle(context: context).secondary
        : HomeStyle(context: context).primary;
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        color: color,
        fit: BoxFit.cover,
      ),
      label: label,
    );
  }
}
