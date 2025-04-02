class Category {
  final int kategoriId;
  final String anaKategoriAdi;
  final String altKategoriAdi;
  final String cesidi;
  final String gorsel;

  Category({
    required this.kategoriId,
    required this.anaKategoriAdi,
    required this.altKategoriAdi,
    required this.cesidi,
    required this.gorsel,
  });

  // JSON'dan Category nesnesine dönüşüm
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      kategoriId: json['kategori_id'] as int? ?? 0,
      anaKategoriAdi: json['ana_kategori_adi'] as String? ?? '',
      altKategoriAdi: json['alt_kategori_adi'] as String? ?? '',
      cesidi: json['cesidi'] as String? ?? '',
      gorsel: json['gorsel'] as String? ?? '',
    );
  }

  // Category nesnesini JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'kategori_id': kategoriId,
      'ana_kategori_adi': anaKategoriAdi,
      'alt_kategori_adi': altKategoriAdi,
      'cesidi': cesidi,
      'gorsel': gorsel,
    };
  }
}
