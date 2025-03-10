part of '../messaging_view.dart';

class _MessagingViewBody extends StatefulWidget {
  const _MessagingViewBody({super.key});

  @override
  State<_MessagingViewBody> createState() => __MessagingViewBodyState();
}

class __MessagingViewBodyState extends State<_MessagingViewBody> {
  bool isSelected = true;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        left: true,
        right: true,
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    boxShadow: [
                      // ignore: deprecated_member_use
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.3),
                          //spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 3))
                    ],
                    color: Theme.of(context).colorScheme.onPrimary,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    MessagingViewTextfield(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        spacing: 25,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: MessagingViewTextbutton(
                                text: 'Kişiler',
                                isSelected: isSelected,
                                onPressed: () {
                                  setState(() {
                                    isSelected = true;
                                  });
                                }),
                          ),
                          Expanded(
                              flex: 1,
                              child: MessagingViewTextbutton(
                                  text: 'Gruplar',
                                  isSelected: !isSelected,
                                  onPressed: () {
                                    setState(() {
                                      isSelected = false;
                                    });
                                  })),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MessagingViewListView(
                    isSelected: isSelected,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
