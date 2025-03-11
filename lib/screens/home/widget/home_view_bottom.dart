part of '../home_screen.dart';

class _HomeBottomNavigationBar extends StatefulWidget {
  const _HomeBottomNavigationBar({super.key});

  @override
  State<_HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<_HomeBottomNavigationBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HomeStyle(context: context).bottomNavigationBarPadding,
      child: ClipRRect(
        borderRadius:
            HomeStyle(context: context).bottomNavigationBarBorderRadius,
        child: BottomNavigationBar(
          backgroundColor: HomeStyle(context: context).secondaryFixedDim,
          selectedItemColor: HomeStyle(context: context).secondary,
          unselectedItemColor: HomeStyle(context: context).primary,
          selectedLabelStyle: TextStyle(
            color: HomeStyle(context: context).secondary,
          ),
          unselectedLabelStyle: TextStyle(
            color: HomeStyle(context: context).primary,
          ),
          currentIndex: _selectedIndex,
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
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              HomeManager(context: context).homeScreen(value);
            });
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      BuildContext context, String label, String iconPath, int index) {
    final color = _selectedIndex == index
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
