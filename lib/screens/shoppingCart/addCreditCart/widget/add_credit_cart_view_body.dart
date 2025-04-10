part of '../add_credit_cart.dart';

class AddCreditCartViewBody extends StatefulWidget {
  final TextEditingController cartNumberController;
  final TextEditingController lateUseDateController;
  final TextEditingController cvvController;
  final TextEditingController cartUserNameController;
  final TextEditingController cartNameController;
  const AddCreditCartViewBody(
      {super.key,
      required this.cartNumberController,
      required this.lateUseDateController,
      required this.cvvController,
      required this.cartUserNameController,
      required this.cartNameController});

  @override
  State<AddCreditCartViewBody> createState() => _AddCreditCartViewBodyState();
}

class _AddCreditCartViewBodyState extends State<AddCreditCartViewBody> {
  final storage = FlutterSecureStorage();
  String? cardNumber;
  String? cardName;
  String? cardUserName;
  String? cardCvv;
  String? cardLateUseDate;
  bool _isSaveButton = false;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    cardNumber = widget.cartNumberController.text;
    cardName = widget.cartNameController.text;
    cardUserName = widget.cartUserNameController.text;
    cardCvv = widget.cvvController.text;
    cardLateUseDate = widget.lateUseDateController.text;

    widget.cartNumberController.addListener(validateForm);
    widget.lateUseDateController.addListener(validateForm);
    widget.cvvController.addListener(validateForm);
    widget.cartNameController.addListener(validateForm);
    widget.cartUserNameController.addListener(validateForm);
  }

  void validateForm() {
    setState(() {
      cardNumber = widget.cartNumberController.text;
      cardName = widget.cartNameController.text;
      cardUserName = widget.cartUserNameController.text;
      cardCvv = widget.cvvController.text;
      cardLateUseDate = widget.lateUseDateController.text;
    });
    bool shouldEnable = widget.cartNumberController.text.length >= 16 &&
        widget.cartUserNameController.text.length > 1 &&
        widget.cvvController.text.length >= 3 &&
        widget.lateUseDateController.text.length >= 5 &&
        _isChecked == true;
    if (shouldEnable) {
      setState(() {
        _isSaveButton = true;
      });
    } else {
      setState(() {
        _isSaveButton = false;
      });
    }
  }

  @override
  void dispose() {
    widget.cartNumberController.dispose();
    widget.lateUseDateController.dispose();
    widget.cvvController.dispose();
    widget.cartUserNameController.dispose();
    widget.cartNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final themeData = HomeStyle(context: context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          spacing: 15,
          children: [
            CreditCardUi(
              cardHolderFullName: cardUserName == ''
                  ? 'Kart sahibinin adı'
                  : cardUserName ?? 'Kart sahibinin adı',
              cardNumber: cardNumber == ''
                  ? '0000 0000 0000 0000'
                  : cardNumber ?? '0000 0000 0000 0000',
              validFrom: '00/00',
              validThru:
                  cardLateUseDate == '' ? '00/00' : cardLateUseDate ?? '00/00',
              topLeftColor: Colors.blue,
              doesSupportNfc: true,
              placeNfcIconAtTheEnd: true,
              bottomRightColor: Colors.purple,

              cardType: CardType.debit,
              //cardProviderLogo: FlutterLogo(),
              cardProviderLogoPosition: CardProviderLogoPosition.right,
              autoHideBalance: true,
              enableFlipping: true, // 👈 Enables the flipping
              cvvNumber: cardCvv == ''
                  ? '000'
                  : cardCvv ??
                      '000', // 👈 CVV number to be shown on the back of the card
            ),
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerText(context, themeData, 'Kart Numarası'),
                textField(context,
                    hintText: "0000 0000 0000 0000",
                    keyboardType: TextInputType.datetime,
                    controller: widget.cartNumberController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(
                          16), // 16 rakam + 3 boşluk = 19 karakter
                      CardNumberInputFormatter(),
                    ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  _headerText(context, themeData, 'Son Kullanma Tarihi'),
                  SizedBox(
                    child: textField(context,
                        hintText: '00/00',
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(
                              4), // 16 rakam + 3 bölü = 19 karakter
                          TwoCharSlashInputFormatter(),
                        ],
                        controller: widget.lateUseDateController),
                    width: width * 0.45,
                  ),
                ]),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    _headerText(context, themeData, 'CVV'),
                    SizedBox(
                      child: textField(context,
                          hintText: '000',
                          keyboardType: TextInputType.datetime,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                          ],
                          controller: widget.cvvController),
                      width: width * 0.45,
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                _headerText(context, themeData, 'Kart Sahibi Adı'),
                textField(context,
                    hintText: 'Kart sahibinin adı',
                    keyboardType: TextInputType.name,
                    controller: widget.cartUserNameController),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                _headerText(context, themeData, 'Kart İsmi'),
                textField(context,
                    hintText: 'Kart ismini giriniz',
                    keyboardType: TextInputType.name,
                    controller: widget.cartNameController),
              ],
            ),
            CheckboxListTile(
              title: customText('Kartı daha sonrası için kaydet', context),
              value: _isChecked,
              activeColor: Colors.blue,
              onChanged: (bool? newValue) {
                setState(() {
                  _isChecked = newValue ?? false;
                  validateForm();
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, // Onay kutusunu başa alır
            ),
            textButton(
              context,
              'Kaydet',
              elevation: 6,
              weight: FontWeight.w600,
              fontSize: themeData.bodyLarge.fontSize,
              buttonColor: _isSaveButton
                  ? themeData.secondary
                  : themeData.primary.withOpacity(0.3),
              shadowColor: _isSaveButton
                  ? themeData.secondary
                  : themeData.primary.withOpacity(0.3),
              onPressed: _isSaveButton
                  ? () {
                      setState(() {
                        storage.write(key: 'cardNumber', value: cardNumber);
                        storage.write(key: 'lateDate', value: cardLateUseDate);
                        storage.write(key: 'cvv', value: cardCvv);
                        storage.write(key: 'cartUserName', value: cardUserName);
                        storage.write(key: 'cartName', value: cardName);

                        showTemporarySnackBar(context, 'Kart kaydedildi');
                        Navigator.pop(context);
                      });
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Padding _headerText(BuildContext context, HomeStyle themeData, String text) {
    return customText(text, context,
        size: themeData.bodyLarge.fontSize, weight: FontWeight.w600);
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i + 1 != text.length) {
        buffer.write(' '); // Her 4 karakterden sonra bir boşluk ekle
      }
    }

    final formattedText = buffer.toString();
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class TwoCharSlashInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 2 == 0 && i + 1 != text.length) {
        buffer.write('/'); // Her 2 karakterden sonra '/' ekle
      }
    }

    final formattedText = buffer.toString();
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
