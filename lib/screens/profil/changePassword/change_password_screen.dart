part of '../SignIn/sign_in_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isTextsSame = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showNewPasswordText = true;
  bool showConfirmPasswordText = true;

  @override
  void initState() {
    super.initState();
    // İki controller için dinleyici ekliyoruz.
    newPasswordController.addListener(_validatePasswords);
    confirmPasswordController.addListener(_validatePasswords);
  }

  void _validatePasswords() {
// Her iki alan boşsa, kontrolü atla
    if (newPasswordController.text.isEmpty &&
        confirmPasswordController.text.isEmpty) {
      return;
    }
    final areEqual =
        newPasswordController.text == confirmPasswordController.text;
    // Eğer durum değişiyorsa state güncelleniyor.
    if (areEqual != isTextsSame) {
      setState(() {
        isTextsSame = areEqual;
      });
    }
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: SignInAppBar(context),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            headText(context),
            passwordContainer(width, context,
                hintText: 'Enter new password',
                containerText: 'New password',
                textFieldHeight: 50,
                containerHeight: 80,
                showSuffixIcon: true,
                obscureText: showNewPasswordText, onTap: () {
              setState(() {
                showNewPasswordText = !showNewPasswordText;
              });
            }, textFieldController: newPasswordController),
            passwordContainer(width, context,
                hintText: 'Enter new password again',
                containerText: 'Countinue new password',
                textFieldHeight: 50,
                containerHeight: 80,
                obscureText: showConfirmPasswordText,
                showSuffixIcon: true,
                textFieldController: confirmPasswordController, onTap: () {
              setState(() {
                showConfirmPasswordText = !showConfirmPasswordText;
              });
            }),
            NextButton(
              context,
              isTextsSame,
              onPressed: isTextsSame ?? false ? () {} : null,
            ),
          ],
        ),
      )),
    );
  }
}
