part of 'profile_screen.dart';

class ProfileNotLogin extends StatefulWidget {
  const ProfileNotLogin({super.key});

  @override
  State<ProfileNotLogin> createState() => _profileNotLoginState();
}

class _profileNotLoginState extends State<ProfileNotLogin> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/vectors/vite.svg',
              fit: BoxFit.cover,
              placeholderBuilder: (BuildContext context) {
                return Container(
                    padding: const EdgeInsets.all(30.0),
                    child: const CircularProgressIndicator());
              },
            ),
            customText('Profilim', context,
                size: HomeStyle(context: context).bodyLarge.fontSize,
                weight: FontWeight.w500),
            customText('Profilinizi görüntüleyebilmek için lütfen giriş yapın.',
                context,
                size: 13),
            textButton(
              context,
              'Üye Ol',
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, '/profil/signUp');
                });
              },
              shadowColor:
                  HomeStyle(context: context).secondary.withOpacity(0.5),
            ),
            textButton(
              context,
              'Giriş Yap',
              buttonColor:
                  HomeStyle(context: context).secondary.withOpacity(0.2),
              titleColor: HomeStyle(context: context).tertiary,
              shadowColor:
                  HomeStyle(context: context).secondary.withOpacity(0.5),
              onPressed: () {
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
