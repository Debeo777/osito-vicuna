import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/merch_item.dart';

/// Pantalla de merchandising (print-on-demand).
/// Abre la tienda externa al pulsar "Ver en tienda".
class MerchScreen extends StatelessWidget {
  const MerchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchandising'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Objetos físicos de dudosa necesidad',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            'Disponibles en nuestra tienda externa. El osito no gestiona los envíos.',
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          ...MerchItem.catalog.map((item) => _MerchCard(item: item)).toList(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// _MerchCard
// ─────────────────────────────────────────────────────────────────────────────
class _MerchCard extends StatelessWidget {
  final MerchItem item;
  const _MerchCard({required this.item});

  Future<void> _openStore(BuildContext context) async {
    // TODO: Sustituir item.storeUrl por la URL real de tu tienda POD
    final uri = Uri.parse(item.storeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No se pudo abrir la tienda. ¿El osito lo bloqueó?')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // ── Imagen placeholder ───────────────────────────────────────
            // TODO: Reemplazar con Image.asset(item.imagePath, ...) real
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: cs.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: cs.primary.withOpacity(0.2)),
              ),
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 36,
                color: cs.primary.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: cs.primary.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _openStore(context),
                      child: const Text('Ver en tienda'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
