# 🧸 Osito Vicuña — App satírica creepy-cute

App Flutter deliberadamente inútil. Por entretenimiento.

---

## Requisitos

- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android Studio / Xcode para compilar en dispositivo

## Instalación

```bash
# 1. Clona el repositorio
git clone <tu-repositorio>
cd osito_vicuna

# 2. Instala dependencias
flutter pub get

# 3. Crea carpetas de assets (si no existen)
mkdir -p assets/images assets/text

# 4. Ejecuta en modo debug
flutter run
```

> ⚠️ Las imágenes en `assets/images/` son **placeholders**. La app funciona
> sin ellas porque usa widgets de sustitución. Añade tus assets reales cuando
> los tengas.

---

## Estructura del proyecto

```
lib/
├── main.dart          # Entrada. Inicializa Provider.
├── app.dart           # MaterialApp, ThemeData, rutas.
├── routes/
│   └── app_routes.dart
├── screens/
│   ├── splash_screen.dart   # Aviso de sátira + botón Entrar
│   ├── home_screen.dart     # Pantalla principal con el osito
│   ├── store_screen.dart    # Tienda IAP simulada
│   ├── info_screen.dart     # Sobre la app + T&C + Privacidad
│   └── merch_screen.dart    # Merchandising (enlace externo)
├── widgets/
│   └── shared_widgets.dart  # OsitoPlaceholder, AdBannerPlaceholder, BottomNav
├── models/
│   ├── product.dart         # Productos IAP
│   └── merch_item.dart      # Items de merchandising
├── services/
│   ├── iap_service.dart     # Stub de compras in-app
│   └── ads_service.dart     # Stub de anuncios
└── state/
    └── app_state.dart       # Estado global con Provider
```

---

## TODOs principales

### Assets (imágenes)
- [ ] `assets/images/logo_osito.png` — Logo para SplashScreen
- [ ] `assets/images/osito_frontal.png` — Ilustración principal HomeScreen
- [ ] `assets/images/bg_tela.png` — Fondo textura HomeScreen
- [ ] `assets/images/merch_camiseta.png`
- [ ] `assets/images/merch_taza.png`
- [ ] `assets/images/merch_pin.png`

Busca `// TODO: Reemplazar OsitoPlaceholder` / `// TODO: Sustituir por asset real`
en los archivos para encontrar los puntos exactos.

### IAP real (in_app_purchase)
1. Añade a `pubspec.yaml`: `in_app_purchase: ^3.x.x`
2. Configura productos en Google Play Console / App Store Connect
3. Implementa `IapService` (`lib/services/iap_service.dart`)
4. Conecta `IapService` con `AppState.purchaseProduct()`

### Anuncios (AdMob)
1. Añade a `pubspec.yaml`: `google_mobile_ads: ^x.x.x`
2. Añade App ID en `AndroidManifest.xml` e `Info.plist`
3. Implementa `AdsService` (`lib/services/ads_service.dart`)
4. Reemplaza `AdBannerPlaceholder` en `shared_widgets.dart`

### Tienda POD (merchandising)
- Sustituye `https://mi-tienda-osito-vicuna.com` por tu URL real
  en `lib/models/merch_item.dart`

### Contacto
- Sustituye `hola@osito-vicuna.com` en `info_screen.dart`

---

## Notas de la app

Esta app es sátira. No tiene utilidad práctica. Cualquier compra es
voluntaria y por entretenimiento. No hay promesas de valor.
