import 'package:flutter/foundation.dart';

/// Estado global de la aplicación.
/// Gestiona compras en memoria y visibilidad de anuncios.
class AppState extends ChangeNotifier {
  // ── Compras en memoria (simuladas) ──────────────────────────────────────
  bool _hasPremium = false;        // "Versión Premium de Broma"
  bool _hasSombreroSutura = false; // "Sombrero de sutura"
  bool _hasOjoBrillante = false;   // "Ojo brillante extra"

  bool get hasPremium => _hasPremium;
  bool get hasSombreroSutura => _hasSombreroSutura;
  bool get hasOjoBrillante => _hasOjoBrillante;

  /// Si el usuario tiene premium, los anuncios se ocultan.
  bool get showAds => !_hasPremium;

  // ── Métodos de compra simulada ───────────────────────────────────────────

  /// Simula la compra de un producto por su [productId].
  /// TODO: Reemplazar este método con la lógica real de IAP
  ///       (Google Play Billing / StoreKit) a través de IapService.
  Future<bool> purchaseProduct(String productId) async {
    // Simula un delay de red
    await Future.delayed(const Duration(milliseconds: 800));

    switch (productId) {
      case 'premium_broma':
        _hasPremium = true;
        break;
      case 'sombrero_sutura':
        _hasSombreroSutura = true;
        break;
      case 'ojo_brillante':
        _hasOjoBrillante = true;
        break;
      default:
        return false;
    }

    notifyListeners();
    return true;
  }

  bool isProductPurchased(String productId) {
    switch (productId) {
      case 'premium_broma':
        return _hasPremium;
      case 'sombrero_sutura':
        return _hasSombreroSutura;
      case 'ojo_brillante':
        return _hasOjoBrillante;
      default:
        return false;
    }
  }
}
