part of '../SignIn/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isCheckedContract = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Klavye açıldığında UI'nın kaymasını engeller
      appBar: SignInAppBar(context),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          spacing: 15,
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headText(context),
            emailAdressContainer(width, context,
                textFieldHeight: 50, containerHeight: 80),
            usernameContainer(width, context,
                textFieldHeight: 50, containerHeight: 80),
            passwordContainer(width, context,
                textFieldHeight: 50,
                containerHeight: 80,
                obscureText: true,
                showSuffixIcon: true),
            checkContract(
              width,
              context,
              isCheckedContract,
              (value) {
                setState(() {
                  isCheckedContract = value!;
                });
              },
            ),
            NextButton(context, isCheckedContract, minSizeHeight: 50),
            orLine(width, context, containerHeight: 16),
            signInWithGoogle(context, width, containerHeight: 50),
            //SizedBox(height: 5),
            signUpText(
              textFirst: 'Already have an account?',
              textSecond: 'Sign in',
              context,
              () {
                setState(() {
                  Navigator.pushNamed(context, '/profil/signIn');
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
