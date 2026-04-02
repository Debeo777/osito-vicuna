/// Servicio de anuncios publicitarios.
///
/// ESTADO ACTUAL: stub/placeholder. Ver TODOs para integración real con AdMob.
class AdsService {
  static final AdsService _instance = AdsService._internal();
  factory AdsService() => _instance;
  AdsService._internal();

  /// Inicializa el SDK de anuncios.
  ///
  /// TODO: Integrar Google Mobile Ads SDK:
  ///   1. Añadir `google_mobile_ads: ^x.x.x` a pubspec.yaml
  ///   2. Añadir configuración en AndroidManifest.xml y Info.plist
  ///   3. Llamar a MobileAds.instance.initialize()
  Future<void> initialize() async {
    // TODO: await MobileAds.instance.initialize();
  }

  /// Carga un banner publicitario.
  ///
  /// TODO: Retornar un BannerAd real:
  ///   final banner = BannerAd(
  ///     adUnitId: 'ca-app-pub-XXXXXXXX/XXXXXXXX',
  ///     size: AdSize.banner,
  ///     request: const AdRequest(),
  ///     listener: BannerAdListener(...),
  ///   )..load();
  ///   return banner;
  Future<void> loadBanner() async {
    // TODO: implementar carga de banner
  }

  /// Carga un anuncio intersticial.
  ///
  /// TODO: Implementar con InterstitialAd.load(...)
  Future<void> loadInterstitial() async {
    // TODO: implementar carga de intersticial
  }

  /// Muestra el anuncio intersticial si está cargado.
  Future<void> showInterstitial() async {
    // TODO: _interstitialAd?.show();
  }
}
