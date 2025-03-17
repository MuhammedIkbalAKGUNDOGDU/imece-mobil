part of '../../profile_screen.dart';

AppBar _SignUpAppBar(BuildContext context) {
  return AppBar(
    leadingWidth: 30,
    title: customText('Geri', context,
        color: HomeStyle(context: context).secondary,
        size: HomeStyle(context: context).headlineSmall.fontSize,
        weight: FontWeight.bold),
    iconTheme: IconThemeData(
        applyTextScaling: true,
        size: 30,
        color: HomeStyle(context: context)
            .secondary), // Geri butonunun rengi kırmız
    backgroundColor: Colors.transparent,
  );
}
