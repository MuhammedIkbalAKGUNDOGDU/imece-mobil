part of '../add_post_screen.dart';

SingleChildScrollView _AddPostViewBody(
    BuildContext context,
    TextEditingController controllerBaslik,
    TextEditingController controllerAciklama,
    bool isShareButton) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  final themeData = HomeStyle(context: context);

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          _updateImage(context, width, height, themeData),
          customText('Gönderi Detayları', context,
              size: themeData.bodyLarge.fontSize, weight: FontWeight.w600),
          textField(
            context,
            labelText: 'Başlık',
            controller: controllerBaslik,
          ),
          _textFieldAciklama(
              height, context, themeData, controllerAciklama, width),
          _shareButton(context, isShareButton, themeData, width)
        ],
      ),
    ),
  );
}

Align _shareButton(BuildContext context, bool isShareButton,
    HomeStyle themeData, double width) {
  return Align(
    alignment: Alignment.topRight,
    child: textButton(
      context,
      'Paylaş',
      elevation: isShareButton ? 6 : 0,
      buttonColor: isShareButton
          ? themeData.secondary
          : themeData.primary.withOpacity(0.3),
      shadowColor: themeData.secondary,
      minSizeWidth: width * 0.4,
      fontSize: themeData.bodyLarge.fontSize,
      weight: FontWeight.w600,
      onPressed: isShareButton
          ? () {
              showTemporarySnackBar(context, 'onPressed (){Paylaş}');
            }
          : null,
    ),
  );
}

SizedBox _textFieldAciklama(double height, BuildContext context, themeData,
    TextEditingController controllerAciklama, double width) {
  return SizedBox(
      height: height * 0.28,
      width: width,
      child: textField(context,
          controller: controllerAciklama,
          labelText: 'Açıklama',
          expands: true));
}

Container _updateImage(
    BuildContext context, double width, double height, HomeStyle themeData) {
  return container(context,
      width: width,
      height: height * 0.35,
      color: themeData.primary.withOpacity(0.15),
      borderRadius: BorderRadius.circular(8),
      isBoxShadow: false,
      margin: const EdgeInsets.only(bottom: 10),
      child: Center(
          child: richText(
              color: themeData.onSecondary,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              context,
              children: [
            TextSpan(text: '+', style: TextStyle(fontSize: 80)),
            TextSpan(text: '\nGörsel Seç')
          ])));
}
