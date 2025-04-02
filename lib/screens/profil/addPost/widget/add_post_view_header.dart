part of '../add_post_screen.dart';

AppBar _AddPostViewAppBar(BuildContext context) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            customText('Gönderi Oluştur', context,
                size: HomeStyle(context: context).bodyLarge.fontSize,
                weight: FontWeight.bold),
            IconButton(
              icon: Icon(Icons.close_outlined, size: 30),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    ),
    automaticallyImplyLeading: false,
  );
}
