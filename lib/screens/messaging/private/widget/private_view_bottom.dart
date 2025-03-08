part of '../messaging_private_screen.dart';

class _MessagingPrivateBottomView extends StatefulWidget {
  final dynamic item;

  final TextEditingController controller;

  final VoidCallback onPressed;

  const _MessagingPrivateBottomView(
      {required this.item, required this.controller, required this.onPressed});

  @override
  State<_MessagingPrivateBottomView> createState() =>
      _MessagingPrivateBottomViewState();
}

class _MessagingPrivateBottomViewState
    extends State<_MessagingPrivateBottomView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: TextField(
            controller: widget.controller,
            style: const TextStyle(color: Colors.black), // Metin rengi ayarı
            decoration: InputDecoration(
              hintText: 'Metin yaz',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    onPressed: () {
                      // Dosya paylaşım işlevi burada
                    },
                  ),
                  Container(
                    height: 24,
                    width: 1,
                    color: Colors.grey,
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: widget.onPressed,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
