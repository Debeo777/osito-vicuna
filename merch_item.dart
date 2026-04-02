/// Modelo de producto de merchandising (print-on-demand).
class MerchItem {
  final String name;
  final String description;
  final String imagePath;
  final String storeUrl;

  const MerchItem({
    required this.name,
    required this.description,
    required this.imagePath,
    // TODO: Sustituir por URLs reales de tu tienda POD
    this.storeUrl = 'https://mi-tienda-osito-vicuna.com',
  });

  static const List<MerchItem> catalog = [
    MerchItem(
      name: 'Camiseta Osito Vicuña',
      description:
          'Lleva al osito contigo. Puede que te mire fijamente mientras duermes.',
      // TODO: Sustituir por asset real: assets/images/merch_camiseta.png
      imagePath: 'assets/images/merch_camiseta.png',
    ),
    MerchItem(
      name: 'Taza Osito Vicuña',
      description:
          'Cada sorbo es observado. La taza no juzga, pero el osito sí.',
      imagePath: 'assets/images/merch_taza.png',
    ),
    MerchItem(
      name: 'Pin Osito Vicuña',
      description:
          'Pequeño, metálico y ligeramente amenazante. Perfecto para la solapa.',
      imagePath: 'assets/images/merch_pin.png',
    ),
  ];
}
