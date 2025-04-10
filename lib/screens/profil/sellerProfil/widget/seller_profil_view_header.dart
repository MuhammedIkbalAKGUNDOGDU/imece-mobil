part of '../seller_profil_screen.dart';

AppBar _sellerProfilAppBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    title: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
          height: 42,
          child: profilTextField(context, hintText: 'Profil arat...')),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            shareIconButton(context),
            settingsIconButton(context),
          ],
        ),
      ),
    ],
  );
}
