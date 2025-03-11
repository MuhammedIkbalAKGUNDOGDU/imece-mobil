part of '../home_screen.dart';

class _HomeHeaderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeHeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: HomeStyle(context: context).surface,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Arat...',
            hintStyle: TextStyle(color: HomeStyle(context: context).outline),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                'assets/vectors/search.svg',
                // İkonun rengini de tercihinize göre belirleyebilirsiniz:
                color: HomeStyle(context: context).secondary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: HomeStyle(context: context).primary,
              ),
              borderRadius:
                  HomeStyle(context: context).appBarTextFieldBorderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: HomeStyle(context: context).secondary,
              ),
              borderRadius:
                  HomeStyle(context: context).appBarTextFieldBorderRadius,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10.0);
}
