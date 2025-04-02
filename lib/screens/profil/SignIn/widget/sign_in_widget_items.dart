part of '../sign_in_screen.dart';

RichText headText(BuildContext context) {
  return RichText(
      maxLines: 2,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          style: TextStyle(
            fontSize: HomeStyle(context: context).headlineSmall.fontSize,
            fontWeight: FontWeight.w800,
            color: HomeStyle(context: context).primary,
          ),
          children: [
            TextSpan(
              text: 'Welcome to ',
            ),
            TextSpan(
                text: 'İmece',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: HomeStyle(context: context).tertiary,
                )),
          ]));
}

Align signUpText(
  BuildContext context,
  VoidCallback onTap, {
  String textSecond = 'Sign up',
  String textFirst = 'No organization account yet?',
}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customText(textFirst, context),
        GestureDetector(
          onTap: onTap,
          child: RichText(
              maxLines: 2,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                  style: TextStyle(
                    fontSize:
                        HomeStyle(context: context).bodyLarge.fontSize! + 1.0,
                    fontWeight: FontWeight.w400,
                    color: HomeStyle(context: context).secondary,
                  ),
                  children: [
                    TextSpan(
                      text: '$textSecond ',
                      style: TextStyle(),
                    ),
                    TextSpan(
                        text: 'now',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        )),
                  ])),
        ),
      ],
    ),
  );
}

Material signInWithGoogle(
  BuildContext context,
  double width, {
  double? containerHeight,
}) {
  return Material(
    elevation: 16, // Gölgeleme seviyesi
    shadowColor: Colors.black.withOpacity(0.5), // Gölgenin rengi ve opaklığı
    borderRadius: BorderRadius.circular(8), // Kenar yumuşatma
    child: TextButton.icon(
        icon: SvgPicture.network(
            fit: BoxFit.cover,
            'https://raw.githubusercontent.com/MuhammedIkbalAKGUNDOGDU/imece-test-website/25c552598d725eb3014df326583506b5f22215e8/imece/src/assets/vectors/google.svg'),
        style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            )),
            backgroundColor: WidgetStateProperty.all<Color>(
                HomeStyle(context: context).surface),
            minimumSize:
                WidgetStateProperty.all(Size(width, containerHeight ?? 65))),
        onPressed: () {},
        label: customText('sign in with google', context,
            size: HomeStyle(context: context).headlineSmall.fontSize,
            weight: FontWeight.w400)),
  );
}

SizedBox orLine(
  double width,
  BuildContext context, {
  double? containerHeight,
}) {
  return SizedBox(
    width: width,
    height: containerHeight ?? 24,
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: HomeStyle(context: context).outline.withOpacity(0.4),
            height: 2,
          ),
        ),
        Expanded(
          flex: 1,
          child: customText('OR', context,
              color: HomeStyle(context: context).outline.withOpacity(0.4)),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: HomeStyle(context: context).outline.withOpacity(0.4),
            height: 2,
          ),
        ),
      ],
    ),
  );
}

SizedBox NextButton(
  BuildContext context,
  bool isCheckedContract, {
  double? minSizeHeight,
  VoidCallback? onPressed,
}) {
  return textButton(
    context,
    'Next',
    buttonColor: isCheckedContract
        ? null
        : HomeStyle(context: context).outline.withOpacity(0.4),
    shadowColor: isCheckedContract
        ? HomeStyle(context: context).secondary.withOpacity(0.4)
        : null,
    fontSize: HomeStyle(context: context).headlineMedium.fontSize,
    minSizeHeight: minSizeHeight ?? 65,
    onPressed: isCheckedContract == true ? onPressed : null,
  );
}

SizedBox checkContract(double width, BuildContext context,
    bool isCheckedContract, ValueChanged<bool?> onChanged) {
  return SizedBox(
    height: 47,
    width: width,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Checkbox(
            value: isCheckedContract,
            onChanged: (value) {
              onChanged(value);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            activeColor: isCheckedContract
                ? HomeStyle(context: context).secondary
                : HomeStyle(context: context).primary,
          ),
        ),
        Expanded(
          child: RichText(
              maxLines: 2,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: HomeStyle(context: context).primary,
                  ),
                  children: [
                    TextSpan(
                      text: 'I have read and accept the ',
                    ),
                    TextSpan(
                        text: 'Terms of service ',
                        style: TextStyle(
                          color: HomeStyle(context: context).secondary,
                        )),
                    TextSpan(
                      text: 'and ',
                    ),
                    TextSpan(
                        text: 'Privacy Policy ',
                        style: TextStyle(
                          color: HomeStyle(context: context).secondary,
                        )),
                  ])),
        )
      ],
    ),
  );
}

SizedBox passwordContainer(
  double width,
  BuildContext context, {
  String containerText = 'Password',
  String hintText = 'Enter your password',
  double? textFieldHeight,
  double? containerHeight,
  TextEditingController? textFieldController,
  bool obscureText = false,
  VoidCallback? onTap,
  bool showSuffixIcon = false,
}) {
  return SizedBox(
    height: containerHeight ?? 90,
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          containerText,
          context,
          color: HomeStyle(context: context).tertiary,
          size: HomeStyle(context: context).bodyLarge.fontSize,
          weight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
        SizedBox(
            height: textFieldHeight ?? 55,
            child: textField(context,
                hintText: hintText,
                controller: textFieldController,
                obscureText: obscureText,
                showSuffixIcon: showSuffixIcon,
                onTap: onTap)),
      ],
    ),
  );
}

SizedBox emailAdressContainer(double width, BuildContext context,
    {double? textFieldHeight, double? containerHeight}) {
  return SizedBox(
    height: containerHeight ?? 90,
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          'Email Adress',
          context,
          color: HomeStyle(context: context).tertiary,
          size: HomeStyle(context: context).bodyLarge.fontSize,
          weight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
        SizedBox(
            height: textFieldHeight ?? 55,
            child: textField(context, hintText: 'Enter your email adress')),
      ],
    ),
  );
}

SizedBox usernameContainer(double width, BuildContext context,
    {double? textFieldHeight, double? containerHeight}) {
  return SizedBox(
    height: containerHeight ?? 90,
    width: width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
          'Username',
          context,
          color: HomeStyle(context: context).tertiary,
          size: HomeStyle(context: context).bodyLarge.fontSize,
          weight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
        SizedBox(
          height: textFieldHeight ?? 55,
          child: textField(
            context,
            hintText: 'Enter your username',
          ),
        ),
      ],
    ),
  );
}
