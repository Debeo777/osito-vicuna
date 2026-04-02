import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../routes/app_routes.dart';

// ─────────────────────────────────────────────────────────────────────────────
// OsitoPlaceholder
// Muestra una caja con el oso mientras no hay asset real.
// TODO: Sustituir por Image.asset('assets/images/osito_frontal.png') real.
// ─────────────────────────────────────────────────────────────────────────────
class OsitoPlaceholder extends StatelessWidget {
  final double size;
  const OsitoPlaceholder({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: cs.secondary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(size / 4),
        border: Border.all(color: cs.secondary, width: 2),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.pets, size: size * 0.45, color: cs.secondary),
          const SizedBox(height: 6),
          Text(
            '🧸',
            style: TextStyle(fontSize: size * 0.18),
          ),
          // TODO: Reemplazar todo el contenido de este widget con:
          // Image.asset('assets/images/osito_frontal.png', width: size, height: size)
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// AdBannerPlaceholder
// Contenedor para el banner de anuncios. Si el usuario tiene premium, se oculta.
// TODO: Reemplazar el Container interior con un widget de AdMob real.
// ─────────────────────────────────────────────────────────────────────────────
class AdBannerPlaceholder extends StatelessWidget {
  const AdBannerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final showAds = context.watch<AppState>().showAds;
    if (!showAds) return const SizedBox.shrink();

    return Container(
      height: 50,
      color: Colors.grey.shade300,
      alignment: Alignment.center,
      child: Text(
        '[ ANUNCIO PLACEHOLDER ]',
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12,
          fontStyle: FontStyle.italic,
        ),
        // TODO: Reemplazar con:
        // AdWidget(ad: _loadedBannerAd)
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// OsitoBottomNav
// Barra de navegación inferior compartida por Home, Tienda e Info.
// ─────────────────────────────────────────────────────────────────────────────
class OsitoBottomNav extends StatelessWidget {
  final int currentIndex;
  const OsitoBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        final routes = [AppRoutes.home, AppRoutes.store, AppRoutes.info];
        if (index != currentIndex) {
          Navigator.pushReplacementNamed(context, routes[index]);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_rounded),
          label: 'Tienda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info_rounded),
          label: 'Info',
        ),
      ],
    );
  }
}
