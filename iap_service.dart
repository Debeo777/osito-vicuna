/// Servicio de compras in-app (IAP).
///
/// Este servicio actúa como capa de abstracción entre la UI y las
/// APIs nativas de compras (Google Play Billing / Apple StoreKit).
///
/// ESTADO ACTUAL: stub simulado. Ver TODOs para integración real.
class IapService {
  static final IapService _instance = IapService._internal();
  factory IapService() => _instance;
  IapService._internal();

  bool _initialized = false;

  /// Inicializa la conexión con la tienda nativa.
  ///
  /// TODO: Integrar con `in_app_purchase` package:
  ///   1. Añadir `in_app_purchase: ^3.x.x` a pubspec.yaml
  ///   2. Llamar a `InAppPurchase.instance.isAvailable()`
  ///   3. Escuchar el stream `InAppPurchase.instance.purchaseStream`
  Future<void> initialize() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _initialized = true;
    // TODO: await InAppPurchase.instance.isAvailable();
  }

  /// Recupera la información de productos desde la tienda nativa.
  ///
  /// TODO: Reemplazar con llamada real:
  ///   final response = await InAppPurchase.instance
  ///       .queryProductDetails({'premium_broma', 'sombrero_sutura', 'ojo_brillante'});
  Future<void> fetchProducts() async {
    if (!_initialized) await initialize();
    // TODO: Llamar a queryProductDetails() y mapear a modelos locales.
  }

  /// Lanza el flujo de compra nativo para el [productId] dado.
  ///
  /// TODO: Reemplazar con:
  ///   final purchaseParam = PurchaseParam(productDetails: details);
  ///   InAppPurchase.instance.buyNonConsumable(purchaseParam: purchaseParam);
  Future<bool> buyProduct(String productId) async {
    if (!_initialized) await initialize();
    // Simulación: la compra siempre tiene éxito en modo demo.
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  /// Restaura compras previas del usuario.
  ///
  /// TODO: Llamar a InAppPurchase.instance.restorePurchases()
  Future<void> restorePurchases() async {
    // TODO: implementar restauración de compras
  }
}
