/// Modelo de producto digital (IAP).
class Product {
  final String id;
  final String name;
  final String description;
  final String price;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  /// Catálogo de productos in-app.
  /// TODO: En producción, obtener precios y disponibilidad desde
  ///       Google Play Console / App Store Connect a través de IapService.
  static const List<Product> catalog = [
    Product(
      id: 'premium_broma',
      name: 'Versión Premium de Broma',
      description:
          'Desactiva anuncios (que tampoco molestaban tanto) y añade partículas '
          'y un halo sagrado alrededor del osito. Inútil, pero brillante.',
      price: '0,99 €',
    ),
    Product(
      id: 'sombrero_sutura',
      name: 'Sombrero de Sutura',
      description:
          'Un elegante sombrero hecho de hilo de sutura esterilizado. '
          'No lo uses en heridas reales.',
      price: '1,99 €',
    ),
    Product(
      id: 'ojo_brillante',
      name: 'Ojo Brillante Extra',
      description:
          'El osito ya tiene dos ojos, pero ¿por qué no tener uno más que brille? '
          'Ciencia sin respuestas.',
      price: '0,99 €',
    ),
  ];
}
