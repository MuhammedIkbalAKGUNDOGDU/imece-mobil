part of '../messaging_private_screen.dart';

class _MessagingPrivateViewBody extends StatefulWidget {
  final dynamic messages;

  const _MessagingPrivateViewBody({required this.messages});

  @override
  State<_MessagingPrivateViewBody> createState() => _PrivateViewBodyState();
}

class _PrivateViewBodyState extends State<_MessagingPrivateViewBody> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> sortedMessages = List.from(widget.messages)
      ..sort((a, b) => int.parse(b['id']).compareTo(int.parse(a['id'])));

    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          reverse: true,
          itemCount: sortedMessages.length,
          itemBuilder: (context, index) {
            final message = sortedMessages[index];
            final isMe = message['sender'] == 'me';
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: isMe
                    ? [
                        Expanded(
                            child: customContainer(context, isMe, message)),
                        customCircleAvatar(context, message['avatar'], isMe),
                      ]
                    : [
                        customCircleAvatar(context, message['avatar'], isMe),
                        const SizedBox(width: 8),
                        Expanded(
                            child: customContainer(context, isMe, message)),
                      ],
              ),
            );
          },
        )),
      ],
    );
  }
}
