
class User {
  final int id;
  final DateTime? lastLogin;
  final bool isSuperuser;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool isStaff;
  final bool isActive;
  final DateTime dateJoined;
  final String rol;
  final String? telno;
  final String? cinsiyet;
  final bool imeceOnay;
  final bool isOnline;
  final String profilFotograf;
  final String profilBanner;
  final String profilTanitimYazisi;
  final String degerlendirmePuani;
  final String hataYapmaOrani;
  final String bakiye;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;
  final List<dynamic> favoriUrunler;

  User({
    required this.id,
    required this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.rol,
    required this.telno,
    required this.cinsiyet,
    required this.imeceOnay,
    required this.isOnline,
    required this.profilFotograf,
    required this.profilBanner,
    required this.profilTanitimYazisi,
    required this.degerlendirmePuani,
    required this.hataYapmaOrani,
    required this.bakiye,
    required this.groups,
    required this.userPermissions,
    required this.favoriUrunler,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      lastLogin: json['last_login'] != null
          ? DateTime.parse(json['last_login'])
          : null,
      isSuperuser: json['is_superuser'] ?? false,
      username: json['username'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      isStaff: json['is_staff'] ?? false,
      isActive: json['is_active'] ?? false,
      dateJoined: DateTime.parse(json['date_joined']),
      rol: json['rol'] ?? '',
      telno: json['telno'],
      cinsiyet: json['cinsiyet'],
      imeceOnay: json['imece_onay'] ?? false,
      isOnline: json['is_online'] ?? false,
      profilFotograf: json['profil_fotograf'] ?? '',
      profilBanner: json['profil_banner'] ?? '',
      profilTanitimYazisi: json['profil_tanitim_yazisi'] ?? '',
      degerlendirmePuani: json['degerlendirme_puani'] ?? '0.0',
      hataYapmaOrani: json['hata_yapma_orani'] ?? '0.00',
      bakiye: json['bakiye'] ?? '0.00',
      groups: json['groups'] is List ? json['groups'] : [],
      userPermissions:
          json['user_permissions'] is List ? json['user_permissions'] : [],
      favoriUrunler:
          json['favori_urunler'] is List ? json['favori_urunler'] : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_login': lastLogin?.toIso8601String(),
      'is_superuser': isSuperuser,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'is_staff': isStaff,
      'is_active': isActive,
      'date_joined': dateJoined.toIso8601String(),
      'rol': rol,
      'telno': telno,
      'cinsiyet': cinsiyet,
      'imece_onay': imeceOnay,
      'is_online': isOnline,
      'profil_fotograf': profilFotograf,
      'profil_banner': profilBanner,
      'profil_tanitim_yazisi': profilTanitimYazisi,
      'degerlendirme_puani': degerlendirmePuani,
      'hata_yapma_orani': hataYapmaOrani,
      'bakiye': bakiye,
      'groups': groups,
      'user_permissions': userPermissions,
      'favori_urunler': favoriUrunler,
    };
  }
}
