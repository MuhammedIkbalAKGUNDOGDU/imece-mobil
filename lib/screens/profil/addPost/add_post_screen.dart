import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/container.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/core/widgets/showTemporarySnackBar.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/core/widgets/textField.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

part 'widget/add_post_view_body.dart';
part 'widget/add_post_view_header.dart';

class AddPost extends StatefulWidget implements PreferredSizeWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _controllerBaslik = TextEditingController();
  final TextEditingController _controllerAciklama = TextEditingController();
  bool isShareButton = false;

  @override
  void initState() {
    super.initState();
    _controllerBaslik.addListener(_validateForm);
    _controllerAciklama.addListener(_validateForm);
  }

  void _validateForm() {
    print(
        "Baslik: ${_controllerBaslik.text}, Aciklama: ${_controllerAciklama.text}");
    // Üç controller'daki text uzunluklarına göre butonun aktifliğini belirleyelim.
    bool shouldEnable = _controllerBaslik.text.length >= 4 &&
        _controllerAciklama.text.length >= 4;

    // Değişiklik varsa UI'ı güncelle.
    if (shouldEnable != isShareButton) {
      setState(() {
        isShareButton = shouldEnable;
      });
    }
  }

  @override
  void dispose() {
    // Controller'ı temizle
    _controllerAciklama.dispose();
    _controllerBaslik.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _AddPostViewAppBar(context),
      body: _AddPostViewBody(
          context, _controllerBaslik, _controllerAciklama, isShareButton),
    );
  }
}
