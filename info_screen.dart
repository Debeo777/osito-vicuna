import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/shared_widgets.dart';

/// Pantalla de información legal y sobre la app.
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Info & Legal')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // ── Sobre la app ─────────────────────────────────────────
                _SectionHeader(title: 'Sobre la app'),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Osito Vicuña es una aplicación satírica, deliberadamente '
                      'inútil, de estilo creepy-cute. No tiene ninguna utilidad '
                      'práctica.\n\n'
                      'Todas las compras realizadas dentro de la app son '
                      'completamente voluntarias y tienen un propósito únicamente '
                      'de entretenimiento. No prometemos recompensas, retornos '
                      'económicos ni resultados de ningún tipo.\n\n'
                      'Si esperabas algo útil de esta app, lamentamos la confusión. '
                      'El osito tampoco lo entendía.',
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(height: 1.6),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // ── Términos y condiciones ───────────────────────────────
                _SectionHeader(title: 'Términos y Condiciones'),
                const SizedBox(height: 8),
                // TODO: Cargar desde assets/text/terminos.txt cuando exista el archivo
                _AssetTextCard(
                  assetPath: 'assets/text/terminos.txt',
                  fallback:
                      'Al usar esta aplicación, aceptas que:\n\n'
                      '1. Esta app es satírica y no tiene propósito práctico.\n'
                      '2. Todas las compras son voluntarias y por entretenimiento.\n'
                      '3. No se ofrecen garantías de ningún tipo.\n'
                      '4. El osito no es responsable de nada.\n'
                      '5. Especialmente de tus sueños después de usarla.\n\n'
                      'Ley aplicable: la del sentido común, que claramente no '
                      'consultaste antes de instalar esta app.',
                ),

                const SizedBox(height: 24),

                // ── Política de privacidad ───────────────────────────────
                _SectionHeader(title: 'Política de Privacidad'),
                const SizedBox(height: 8),
                // TODO: Cargar desde assets/text/privacidad.txt cuando exista el archivo
                _AssetTextCard(
                  assetPath: 'assets/text/privacidad.txt',
                  fallback:
                      'Esta aplicación NO recopila datos personales.\n\n'
                      'No tenemos servidores. No guardamos nada. '
                      'El osito es incapaz de enviar información a ningún lado '
                      'porque es de peluche digital.\n\n'
                      'Sin embargo, si en el futuro integramos anuncios o IAP '
                      'reales, sus respectivos SDKs (AdMob, Google Play, '
                      'App Store) tendrán sus propias políticas de privacidad, '
                      'a las que deberás adherirte.',
                ),

                const SizedBox(height: 24),

                // ── Contacto ─────────────────────────────────────────────
                _SectionHeader(title: 'Contacto'),
                const SizedBox(height: 8),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.email_rounded),
                    title: const Text('Enviar un correo'),
                    subtitle: const Text(
                        'hola@osito-vicuna.com'), // TODO: sustituir
                    onTap: () async {
                      // TODO: Sustituir con dirección de contacto real
                      final uri = Uri.parse(
                          'mailto:hola@osito-vicuna.com'
                          '?subject=Consulta%20Osito%20Vicu%C3%B1a');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
          const AdBannerPlaceholder(),
        ],
      ),
      bottomNavigationBar: const OsitoBottomNav(currentIndex: 2),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _SectionHeader
// ─────────────────────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: cs.secondary,
            fontWeight: FontWeight.w800,
          ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _AssetTextCard
// Carga texto desde un asset; si falla, muestra el fallback.
// ─────────────────────────────────────────────────────────────────────────────
class _AssetTextCard extends StatelessWidget {
  final String assetPath;
  final String fallback;
  const _AssetTextCard({required this.assetPath, required this.fallback});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString(assetPath).catchError((_) => fallback),
      builder: (context, snapshot) {
        final text = snapshot.data ?? fallback;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(height: 1.6),
            ),
          ),
        );
      },
    );
  }
}
