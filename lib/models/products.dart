// lib/models/product.dart

class Product {
  final int? urunId;
  final String? urunAdi;
  final String? aciklama;
  final String? urunUretimTarihi;
  final String? urunEklemeTarihi;
  final String? urunBilgisiGuncellemeTarihi;
  final String? urunKalitesi;
  final String? birimi;
  final dynamic fiyat;
  final int? stokDurumu;
  final dynamic degerlendirmePuani;
  final int? minimumSiparisMiktari;
  final String? labSonucPdf;
  final String? urunSertifikaPdf;
  final String? kapakGorseli;
  final bool? urunGorunurluluk;
  final int? satici;
  final int? kategori;
  final double? populerlik;

  Product({
    this.urunId,
    this.urunAdi,
    this.aciklama,
    this.urunUretimTarihi,
    this.urunEklemeTarihi,
    this.urunBilgisiGuncellemeTarihi,
    this.urunKalitesi,
    this.birimi,
    this.fiyat,
    this.stokDurumu,
    this.degerlendirmePuani,
    this.minimumSiparisMiktari,
    this.labSonucPdf,
    this.urunSertifikaPdf,
    this.kapakGorseli,
    this.urunGorunurluluk,
    this.satici,
    this.kategori,
    this.populerlik,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      urunId: json['urun_id'] as int? ?? json['id'],
      urunAdi: json['urun_adi'] as String? ?? '',
      aciklama: json['aciklama'] as String? ?? '',
      urunUretimTarihi: json['urun_uretim_tarihi'] as String? ?? '',
      urunEklemeTarihi: json['urun_ekleme_tarihi'] as String? ?? '',
      urunBilgisiGuncellemeTarihi:
          json['urunbilgisi_guncelleme_tarihi'] as String? ?? '',
      urunKalitesi: json['urun_kalitesi'] as String? ?? '',
      birimi: json['birimi'] as String? ?? '',
      fiyat: json['fiyat'] as dynamic ?? 0.0,
      stokDurumu: json['stok_durumu'] as int? ?? 0,
      degerlendirmePuani: json['degerlendirme_puani'] as dynamic ?? 0.0,
      minimumSiparisMiktari: json['minimum_siparis_miktari'] as int? ?? 0,
      labSonucPdf: json['lab_sonuc_pdf'] as String? ?? '',
      urunSertifikaPdf: json['urun_sertifika_pdf'] as String? ?? '',
      kapakGorseli: json['kapak_gorseli'] as String? ?? '',
      urunGorunurluluk: json['urun_gorunurluluk'] as bool? ?? false,
      satici: json['satici'] as int? ?? 0,
      kategori: json['kategori'] as int? ?? 0,
      populerlik: json['populerlik'] as double? ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'urun_id': urunId,
      'urun_adi': urunAdi,
      'aciklama': aciklama,
      'urun_uretim_tarihi': urunUretimTarihi,
      'urun_ekleme_tarihi': urunEklemeTarihi,
      'urunbilgisi_guncelleme_tarihi': urunBilgisiGuncellemeTarihi,
      'urun_kalitesi': urunKalitesi,
      'birimi': birimi,
      'fiyat': fiyat,
      'stok_durumu': stokDurumu,
      'degerlendirme_puani': degerlendirmePuani,
      'minimum_siparis_miktari': minimumSiparisMiktari,
      'lab_sonuc_pdf': labSonucPdf,
      'urun_sertifika_pdf': urunSertifikaPdf,
      'kapak_gorseli': kapakGorseli,
      'urun_gorunurluluk': urunGorunurluluk,
      'satici': satici,
      'kategori': kategori,
      'populerlik': populerlik,
    };
  }
}
