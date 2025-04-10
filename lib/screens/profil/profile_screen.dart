import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imecehub/core/widgets/text.dart';
import 'package:imecehub/core/widgets/textButton.dart';
import 'package:imecehub/models/users.dart';
import 'package:imecehub/screens/home/style/home_screen_style.dart';
import 'package:imecehub/screens/profil/sellerProfil/seller_profil_screen.dart';
import 'package:imecehub/services/api_service.dart';
part 'profileNotLogin.dart';

part 'SignUp/widget/sign_up_view_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loginUser = true;
  int testUserId = 3;
  static User? cachedSeller;
  Future<User>? futureUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureSeller();
  }

  void _futureSeller() async {
    // Aşağıdaki kodu initState içine ekleyerek, eğer cachedProducts dolu ise
    // API çağrısı yapmadan cache'den verileri kullanıyoruz.
    if (cachedSeller != null && cachedSeller! != null) {
      // Cache dolu ise: direkt veriyi Future.value ile sarıyoruz.
      futureUser = Future.value(cachedSeller);
    } else {
      // İlk açılışta veya cache boşsa API’den verileri çek
      futureUser = ApiService.fetchUserId(testUserId);
      futureUser!.then((Seller) {
        // Gelen veriyi cache'e atıyoruz.
        cachedSeller = Seller;
      }).catchError((error) {
        return Text('Hata Oluştu: $error');
      });
    }
  }

  // Refresh işlemini gerçekleştiren metod:
  Future<void> _refreshSeller() async {
    // API'den verileri çek ve cache'i güncelle
    User freshSeller = await ApiService.fetchUserId(testUserId) as User;
    setState(() {
      futureUser = Future.value(freshSeller);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _refreshSeller,
        child: FutureBuilder<User>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 25,
                      children: [
                        Text('Error: ${snapshot.error}'),
                        textButton(
                          context,
                          'Tekrar Dene',
                          onPressed: () {
                            setState(() {
                              _futureSeller();
                            });
                          },
                        )
                      ],
                    ));
              }
              return loginUser
                  ? SellerProfilScreen(
                      sellerProfil: snapshot.data!,
                      myProfile: loginUser,
                    )
                  : ProfileNotLogin();
            } else {
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }
}
