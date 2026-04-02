import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../state/app_state.dart';
import '../widgets/shared_widgets.dart';
import '../routes/app_routes.dart';

/// Tienda in-app con productos digitales cosméticos.
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.merch),
            child: Text(
              'Merch 🛒',
              style: TextStyle(color: cs.surface),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(
                  'Productos digitales',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'Solo por entretenimiento. Ninguno tiene utilidad práctica.',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                ...Product.catalog
                    .map((p) => _ProductCard(product: p))
                    .toList(),
                const SizedBox(height: 8),
                // Botón restaurar compras
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          '🔄 Compras restauradas. (Solo en tu imaginación por ahora.)',
                        ),
                      ),
                    );
                    // TODO: llamar a IapService().restorePurchases()
                  },
                  child: const Text('Restaurar compras'),
                ),
              ],
            ),
          ),
          const AdBannerPlaceholder(),
        ],
      ),
      bottomNavigationBar: const OsitoBottomNav(currentIndex: 1),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _ProductCard
// ─────────────────────────────────────────────────────────────────────────────
class _ProductCard extends StatefulWidget {
  final Product product;
  const _ProductCard({required this.product});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _loading = false;

  Future<void> _handlePurchase(BuildContext context) async {
    final appState = context.read<AppState>();
    if (appState.isProductPurchased(widget.product.id)) return;

    setState(() => _loading = true);

    // TODO: En producción, llamar primero a IapService().buyProduct(id)
    //       y solo actualizar AppState si la respuesta nativa confirma la compra.
    final success = await appState.purchaseProduct(widget.product.id);

    if (mounted) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? '✅ "${widget.product.name}" adquirido. Bien gastado.'
                : '❌ Algo salió mal. El osito está desconcertado.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final purchased =
        context.watch<AppState>().isProductPurchased(widget.product.id);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.name,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                if (purchased)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '✓ Tuyo',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.description,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: cs.primary.withOpacity(0.7)),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.price,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: cs.secondary,
                    fontSize: 22,
                  ),
                ),
                _loading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : ElevatedButton(
                        onPressed: purchased
                            ? null
                            : () => _handlePurchase(context),
                        style: ElevatedButton.styleFrom(
                          disabledBackgroundColor:
                              Colors.grey.shade200,
                        ),
                        child: Text(purchased ? 'Adquirido' : 'Comprar'),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
