import 'package:flutter/material.dart';
import 'package:imecehub/core/widgets/richText.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';

class PastPaymentsMoreView extends StatelessWidget {
  final dynamic pastPayments;

  const PastPaymentsMoreView({super.key, required this.pastPayments});

  @override
  Widget build(BuildContext context) {
    final themeData = HomeStyle(context: context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeData.secondary,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: customText(
          'Geçmiş Ödemeler',
          context,
          size: themeData.headlineSmall.fontSize,
          color: themeData.secondary,
          weight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Expanded(
            child: ListView.builder(
              itemCount: pastPayments.length,
              itemBuilder: (context, index) {
                final payment = pastPayments[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    richText(
                        color: themeData.primary.withOpacity(0.5),
                        context,
                        children: [
                          TextSpan(
                              text: "${payment['date']}'te yatırılan tutar: "),
                          TextSpan(
                              text: '${payment['amount']} ₺',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                    Divider()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
