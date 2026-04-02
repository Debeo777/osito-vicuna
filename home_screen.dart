import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../widgets/shared_widgets.dart';

/// Pantalla principal con el osito y los tres botones absurdos.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  // Controlador de animación "shake" para el osito
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;

  // Índice del botón activo (para cambiar expresión)
  int? _activeButton;

  // Mensajes humorísticos por botón
  static const Map<int, String> _messages = {
    0: '🧵 Sutura aplicada con precisión científica dudosa. '
        'La herida ahora tiene su propio nombre: Eduardo.',
    1: '🦙 La vicuña dice: "La fibra óptica es el futuro, '
        'pero yo prefiero la fibra de alpaca." No tenía sentido. Bien.',
    2: '🔬 Modo científico activado. Detectado: 0 propósitos. '
        'Calculando el significado de la existencia... error 404.',
  };

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticIn),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _onButtonPressed(BuildContext context, int index) {
    setState(() => _activeButton = index);
    _shakeController.forward(from: 0);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_messages[index] ?? ''),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final hasPremium = context.watch<AppState>().hasPremium;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Osito Vicuña'),
        centerTitle: true,
      ),
      // ── Fondo de textura ────────────────────────────────────────────────
      // TODO: Reemplazar el Container por:
      // DecorationImage(image: AssetImage('assets/images/bg_tela.png'), fit: BoxFit.cover)
      body: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          // TODO: Descomentar cuando exista el asset:
          // image: DecorationImage(
          //   image: AssetImage('assets/images/bg_tela.png'),
          //   fit: BoxFit.cover,
          //   opacity: 0.6,
          // ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // ── Osito animado ────────────────────────────────────
                    AnimatedBuilder(
                      animation: _shakeAnimation,
                      builder: (context, child) {
                        final shake = _shakeAnimation.value;
                        final offset = shake > 0
                            ? (shake * 8 * (shake.round() % 2 == 0 ? 1 : -1))
                            : 0.0;
                        return Transform.translate(
                          offset: Offset(offset, 0),
                          child: child,
                        );
                      },
                      // TODO: Reemplazar OsitoPlaceholder por:
                      // Image.asset('assets/images/osito_frontal.png', width: 200)
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          OsitoPlaceholder(
                            size: 200,
                          ),
                          // Halo de premium
                          if (hasPremium)
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.amber.withOpacity(0.7),
                                    blurRadius: 12,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.star,
                                  color: Colors.white, size: 18),
                            ),
                        ],
                      ),
                    ),

                    if (hasPremium) ...[
                      const SizedBox(height: 8),
                      // Efecto de partículas simulado con texto
                      Text(
                        '✨ ✦ ⋆ ✨ ✦ ⋆ ✨',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.amber.shade600,
                          letterSpacing: 4,
                        ),
                      ),
                    ],

                    const SizedBox(height: 32),

                    // ── Título contextual por botón activo ───────────────
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        _activeButton == null
                            ? '¿Qué desea el osito hoy?'
                            : _activeButton == 0
                                ? '🩹 Modo cirugía activado'
                                : _activeButton == 1
                                    ? '🦙 Canal vicuña abierto'
                                    : '🔬 Ciencia en progreso...',
                        key: ValueKey(_activeButton),
                        style: theme.textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── Botones absurdos ──────────────────────────────────
                    _AbsurdButton(
                      label: 'Suturar brazo',
                      icon: Icons.healing_rounded,
                      isActive: _activeButton == 0,
                      color: cs.secondary,
                      onPressed: () => _onButtonPressed(context, 0),
                    ),
                    const SizedBox(height: 12),
                    _AbsurdButton(
                      label: 'Hablar con la vicuña',
                      icon: Icons.chat_bubble_rounded,
                      isActive: _activeButton == 1,
                      color: cs.tertiary,
                      onPressed: () => _onButtonPressed(context, 1),
                    ),
                    const SizedBox(height: 12),
                    _AbsurdButton(
                      label: 'Modo científico',
                      icon: Icons.science_rounded,
                      isActive: _activeButton == 2,
                      color: cs.primary,
                      onPressed: () => _onButtonPressed(context, 2),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // ── Banner de anuncios ────────────────────────────────────────
            const AdBannerPlaceholder(),
          ],
        ),
      ),
      bottomNavigationBar: const OsitoBottomNav(currentIndex: 0),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _AbsurdButton — botón individual con animación de color
// ─────────────────────────────────────────────────────────────────────────────
class _AbsurdButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final Color color;
  final VoidCallback onPressed;

  const _AbsurdButton({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: isActive
            ? [BoxShadow(color: color.withOpacity(0.4), blurRadius: 12)]
            : [],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? color : color.withOpacity(0.75),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
