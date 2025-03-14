import 'package:flutter/material.dart';

class MessagingViewListView extends StatefulWidget {
  final bool isSelected;
  MessagingViewListView({required this.isSelected, super.key});

  @override
  State<MessagingViewListView> createState() => _MessagingViewListViewState();
}

class _MessagingViewListViewState extends State<MessagingViewListView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // Örnek users listesi
  final List<Map<String, dynamic>> users = [
    {
      'img_url': 'https://via.placeholder.com/150',
      'name': 'Lorem ipsum',
      'description': 'Son yazılan metin...',
      'view': 'true'
    },
    {
      'img_url': 'https://via.placeholder.com/150',
      'name': 'Lorem ipsum',
      'description': 'Son yazılan metin...',
      'view': 'true'
    },
    {
      'img_url': 'https://via.placeholder.com/150',
      'name': 'Lorem ipsum',
      'description': 'Son yazılan metin...',
      'view': 'true'
    },
  ];

  // Örnek groups listesi
  final List<Map<String, dynamic>> groups = [
    {
      'img_url': 'https://via.placeholder.com/150',
      'name': 'Group A',
      'description': 'Son yazılan metin...',
      'view': 'true'
    },
    {
      'img_url': 'https://via.placeholder.com/150',
      'name': 'Group B',
      'description': 'Son yazılan metin...',
      'view': 'true'
    },
    {
      'img_url': 'https://via.placeholder.com/150',
      'name': 'Group C',
      'description': 'Son yazılan metin...',
      'view': 'false'
    },
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.isSelected;
    return ListView.builder(
      itemCount: isSelected ? groups.length : users.length,
      itemBuilder: (context, index) {
        final item = isSelected ? users[index] : groups[index];
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: Image.asset('assets/icon/profil.svg').image,
              ),
              title: Text(item['name']),
              subtitle: Text(item['description']),
              trailing: item['view'] == 'true'
                  ? SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/icon/ic_showMessage.svg'),
                    )
                  : SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/icon/ic_showedMessage.svg'),
                    ),
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, '/messaging/private',
                      arguments: item);
                });
              },
            ),
            Divider()
          ],
        );
      },
    );
  }
}
