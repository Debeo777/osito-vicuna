import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/shared_widgets.dart';

/// Pantalla de bienvenida / aviso de sátira.
/// Muestra el logo, el aviso legal-humorístico y el botón "Entrar".
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // ── Logo ──────────────────────────────────────────────────────
              // TODO: Reemplazar OsitoPlaceholder por:
              // Image.asset('assets/images/logo_osito.png', width: 160)
              const OsitoPlaceholder(size: 160),

              const SizedBox(height: 32),

              // ── Título principal ──────────────────────────────────────────
              Text(
                'Esto es sátira.',
                style: theme.textTheme.displayLarge?.copyWith(
                  color: cs.secondary,
                  fontSize: 36,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // ── Aviso legal-humorístico ───────────────────────────────────
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: cs.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: cs.primary.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  'Esta app no tiene utilidad práctica.\n\n'
                  'Todas las compras son voluntarias y por entretenimiento. '
                  'No prometemos recompensas, retornos ni resultados de ningún tipo. '
                  'El osito tampoco promete nada.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(),

              // ── Botón Entrar ──────────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.home,
                  ),
                  child: const Text('Entrar'),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                'v1.0.0 — Por amor al arte y al absurdo',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 11,
                  color: cs.primary.withOpacity(0.5),
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
