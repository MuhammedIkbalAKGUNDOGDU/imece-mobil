import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/profil/messaging/private/widget/private_view_body_circleAvatar.dart';
import 'package:imecehub/screens/profil/messaging/private/widget/private_view_body_container.dart';

part 'widget/private_view_header.dart';
part 'widget/private_view_bottom.dart';
part 'widget/private_view_body.dart';

class MessagingPrivateScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const MessagingPrivateScreen({super.key, required this.item});

  @override
  State<MessagingPrivateScreen> createState() => _MessagingPrivateScreenState();
}

class _MessagingPrivateScreenState extends State<MessagingPrivateScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'Kişi',
      'avatar': 'https://via.placeholder.com/150',
      'message': 'Lorem İmpsum',
      'id': '0',
    },
    {
      'sender': 'Kişi',
      'avatar': 'https://via.placeholder.com/150',
      'message':
          'Lorem İmpsumLorem İmpsumLorem İmpsumLorem İmpsumLorem İmpsumLorem İmpsumLorem İmpsumLorem İmpsumLorem İmpsumLorem İmpsum',
      'id': '1',
    },
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      messages.add({
        'sender': 'me',
        'avatar': 'https://via.placeholder.com/150',
        'message': text,
        'id':
            '${(messages.isNotEmpty ? (int.tryParse(messages.last['id']) ?? 0) : 0) + 1}',
      });
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _PrivateScreenAppBarHeader(
        item: widget.item,
      ),
      bottomNavigationBar: _MessagingPrivateBottomView(
        item: widget.item,
        controller: _controller,
        onPressed: () {
          setState(() {
            _sendMessage();
          });
        },
      ),
      body: _MessagingPrivateViewBody(
        messages: messages,
      ),
    );
  }
}
