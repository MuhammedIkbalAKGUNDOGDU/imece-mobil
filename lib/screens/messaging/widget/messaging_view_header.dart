part of '../messaging_view.dart';

class _MessagingViewHeaderAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _MessagingViewHeaderAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: MediaQuery.of(context).size.width * 0.4,
      toolbarHeight: MediaQuery.of(context).size.height *
          0.06, //AppBar yüksekliği ekran boyutununa oranı

      bottom: PreferredSize(
        preferredSize: preferredSize,
        child: Align(
          alignment: Alignment.bottomLeft,
          child: TextButton.icon(
            onPressed: () {},
            label: customText('Profile Geri Dön', context,
                color: Theme.of(context).colorScheme.secondary),
            icon: Icon(
              Icons.keyboard_backspace,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20.0);
}
