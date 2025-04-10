class Company {
  final int id;
  final String adi;
  final String logo;
  final String website;

  Company({
    required this.id,
    required this.adi,
    required this.logo,
    required this.website,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] ?? 0,
      adi: json['adi'] ?? '',
      logo: json['logo'] ?? '',
      website: json['website'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'adi': adi,
      'logo': logo,
      'website': website,
    };
  }
}
