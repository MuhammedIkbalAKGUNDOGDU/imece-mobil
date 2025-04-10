import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/screens/profil/messaging/messaging_view_mixin.dart';
import 'package:imecehub/screens/profil/messaging/widget/messaging_view_list-view.dart';
import 'package:imecehub/screens/profil/messaging/widget/messaging_view_textButton.dart';
import 'package:imecehub/screens/profil/messaging/widget/messaging_view_textField.dart';

part 'widget/messaging_view_header.dart';
part 'widget/messaging_view_body.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({super.key});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> with MessagingViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _MessagingViewHeaderAppBar(), body: _MessagingViewBody());
  }
}
