part of '../messaging_private_screen.dart';

class _PrivateScreenAppBarHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final Map<String, dynamic> item;
  const _PrivateScreenAppBarHeader({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: MediaQuery.of(context).size.width * 0.07,
      leading: IconButton(
        icon: Icon(
          size: 30,
          Icons.arrow_back,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundImage: Image.asset('assets/icon/profil.svg').image,
        ),
        title: Text(item['name']),
        subtitle: Text(item['description']),
      ),
      toolbarHeight: MediaQuery.of(context).size.height *
          0.18, //AppBar yüksekliği ekran boyutununa oranı
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight + 20.0);
  }
}
