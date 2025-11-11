import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart' as faker_lib;

/// Clase modelo para los elementos de la lista
class Perfume {
  final String id;
  final String nombre;
  final String descripcion;
  final String precio;
  final String imagePath;
  final bool isLocal;
  final String? marca;
  final String? notasOlfativas;
  final String? concentracion;
  final int? duracionHoras;

  Perfume({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.imagePath,
    required this.isLocal,
    this.marca,
    this.notasOlfativas,
    this.concentracion,
    this.duracionHoras,
  });
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  // Generador de datos ficticios realistas
  static final faker = faker_lib.Faker();

  /// Lista de perfumes reales con imágenes locales
  static final List<Perfume> perfumes = [
    // PERFUMES ORIGINALES (con imágenes locales)
    Perfume(
      id: 'perfume_1',
      nombre: 'L\'Homme Prada Intense',
      descripcion: 'L\'Homme Prada Intense (2016) es una fragancia oriental y amaderada que refleja la dualidad y las facetas del hombre carismático con notas de ámbar, pachulí, iris y habas tonka. Se presenta en un icónico frasco negro de Saffiano con el logo plateado de Prada.',
      precio: '132€',
      imagePath: 'assets/images/l-homme-intense-prada.jpg',
      isLocal: true,
      marca: 'Prada',
      concentracion: 'Eau de Parfum',
      duracionHoras: 8,
    ),
    Perfume(
      id: 'perfume_2',
      nombre: 'Luna Rossa Carbon de Prada',
      descripcion: 'Prada Luna Rossa Carbon es una fragancia fougère iconoclasta que fusiona la frescura mineral y la innovación industrial con la naturaleza, con notas de lavanda metálica, cítricos verdes, pachulí y ambroxan.',
      precio: '89€',
      imagePath: 'assets/images/luna-rossa-carbon.jpg',
      isLocal: true,
      marca: 'Prada',
      concentracion: 'Eau de Toilette',
      duracionHoras: 6,
    ),
    Perfume(
      id: 'perfume_3',
      nombre: 'Boss Bottled Parfum de Hugo Boss',
      descripcion: 'BOSS Bottled Parfum es una intensa fragancia amaderada y ambarina con la mayor concentración de la familia, ideal para el hombre que actúa como un BOSS. Combina notas de mandarina, incienso, raíz de Orris, higuera, cedro y cuero vegetal.',
      precio: '118€',
      imagePath: 'assets/images/boss-bottled-parfum.jpg',
      isLocal: true,
      marca: 'Hugo Boss',
      concentracion: 'Parfum',
      duracionHoras: 12,
    ),
    Perfume(
      id: 'perfume_4',
      nombre: 'Sauvage Eau De Parfum de DIOR',
      descripcion: 'Sauvage Eau de Parfum de Dior es un perfume masculino inspirado en el atardecer en el desierto, que combina una vainilla excepcional de Papúa Nueva Guinea con una base amaderada ambarina para un acento sensual.',
      precio: '90,11€',
      imagePath: 'assets/images/sauvage-recharge-eau-de-toilette.jpg',
      isLocal: true,
      marca: 'Dior',
      concentracion: 'Eau de Parfum',
      duracionHoras: 10,
    ),
    // PERFUMES AÑADIDOS CON DATOS ENRIQUECIDOS USANDO FAKER E IMÁGENES DE RED
    Perfume(
      id: 'perfume_5',
      nombre: 'Noir Essentiel',
      descripcion: 'Una fragancia sofisticada con notas amaderadas y especiadas que evoca elegancia y misterio. Perfecta para ocasiones especiales y noches inolvidables.',
      precio: '${faker.randomGenerator.integer(80, min: 45)}€',
      imagePath: 'https://picsum.photos/seed/perfume1/300/300',
      isLocal: false,
      marca: faker.company.name(),
      notasOlfativas: 'Bergamota, Sandalo, Vainilla',
      concentracion: 'Eau de Parfum',
      duracionHoras: faker.randomGenerator.integer(12, min: 6),
    ),
    Perfume(
      id: 'perfume_6',
      nombre: 'Aqua Marine',
      descripcion: 'Fragancia fresca y acuática que captura la esencia del océano. Notas cítricas y marinas que revitalizan los sentidos.',
      precio: '${faker.randomGenerator.integer(95, min: 50)}€',
      imagePath: 'https://picsum.photos/seed/perfume2/300/300',
      isLocal: false,
      marca: faker.company.name(),
      notasOlfativas: 'Citricos, Menta, Almizcle',
      concentracion: 'Eau de Toilette',
      duracionHoras: faker.randomGenerator.integer(10, min: 5),
    ),
    Perfume(
      id: 'perfume_7',
      nombre: 'Velvet Oud',
      descripcion: 'Una composición lujosa que combina la riqueza del oud con suaves notas florales. Fragancia intensa y seductora.',
      precio: '${faker.randomGenerator.integer(150, min: 80)}€',
      imagePath: 'https://picsum.photos/seed/perfume3/300/300',
      isLocal: false,
      marca: faker.company.name(),
      notasOlfativas: 'Oud, Rosa, Cuero',
      concentracion: 'Parfum',
      duracionHoras: faker.randomGenerator.integer(14, min: 8),
    ),
    Perfume(
      id: 'perfume_8',
      nombre: 'Citrus Splash',
      descripcion: 'Energizante combinación de cítricos brillantes con toques herbales. Ideal para el uso diario y momentos de frescura.',
      precio: '${faker.randomGenerator.integer(65, min: 35)}€',
      imagePath: 'https://picsum.photos/seed/perfume4/300/300',
      isLocal: false,
      marca: faker.company.name(),
      notasOlfativas: 'Limon, Neroli, Almizcle',
      concentracion: 'Eau de Cologne',
      duracionHoras: faker.randomGenerator.integer(8, min: 4),
    ),
    Perfume(
      id: 'perfume_9',
      nombre: 'Amber Night',
      descripcion: 'Fragancia cálida y envolvente con notas de ámbar y especias. Crea una atmósfera de confort y sofisticación.',
      precio: '${faker.randomGenerator.integer(110, min: 70)}€',
      imagePath: 'https://picsum.photos/seed/perfume5/300/300',
      isLocal: false,
      marca: faker.company.name(),
      notasOlfativas: 'Ambar, Vainilla, Canela',
      concentracion: 'Eau de Parfum',
      duracionHoras: faker.randomGenerator.integer(9, min: 5),
    ),
    Perfume(
      id: 'perfume_10',
      nombre: 'Wooden Mystique',
      descripcion: 'Composición amaderada con carácter misterioso. Notas de sándalo y vetiver que perduran en la piel.',
      precio: '${faker.randomGenerator.integer(125, min: 75)}€',
      imagePath: 'https://picsum.photos/seed/perfume6/300/300',
      isLocal: false,
      marca: faker.company.name(),
      notasOlfativas: 'Sandalo, Vetiver, Pimienta',
      concentracion: 'Eau de Toilette',
      duracionHoras: faker.randomGenerator.integer(11, min: 7),
    ),
  ];

  // Widget para mostrar imagen con mejor manejo de errores
  Widget _buildPerfumeImage(Perfume perfume) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 80,
        height: 80,
        color: Colors.grey[200],
        child: perfume.isLocal
            ? Image.asset(
                perfume.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('Error cargando imagen local: ${perfume.imagePath}');
                  return _buildPlaceholderImage(perfume.nombre);
                },
              )
            : CachedNetworkImage(
                imageUrl: perfume.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFB8860B)),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) {
                  print('Error cargando imagen de red: $url');
                  return _buildPlaceholderImage(perfume.nombre);
                },
              ),
      ),
    );
  }

  // Widget para imagen de placeholder cuando hay error
  Widget _buildPlaceholderImage(String perfumeName) {
    return Container(
      width: 80,
      height: 80,
      color: const Color(0xFFB8860B).withOpacity(0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.photo_camera, color: Color(0xFF8B4513), size: 24),
          const SizedBox(height: 4),
          Text(
            perfumeName.split(' ').take(2).join('\n'),
            style: const TextStyle(
              fontSize: 9,
              color: Color(0xFF8B4513),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  // Widget para mostrar información extendida del perfume
  Widget _buildPerfumeInfo(Perfume perfume) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          perfume.nombre,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontFamily: 'Roboto',
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        // Marca del perfume
        if (perfume.marca != null) ...[
          const SizedBox(height: 2),
          Text(
            'Marca: ${perfume.marca!}',
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFFB8860B),
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
        ],
        
        // Concentración y duración
        if (perfume.concentracion != null && perfume.duracionHoras != null) ...[
          const SizedBox(height: 2),
          Text(
            '${perfume.concentracion!} • Duracion: ${perfume.duracionHoras!}h',
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black45,
              fontFamily: 'Roboto',
            ),
          ),
        ],
        
        const SizedBox(height: 4),
        Text(
          perfume.precio,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        
        const SizedBox(height: 4),
        Text(
          perfume.descripcion,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontFamily: 'Roboto',
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        // Notas olfativas si están disponibles
        if (perfume.notasOlfativas != null) ...[
          const SizedBox(height: 4),
          Text(
            'Notas: ${perfume.notasOlfativas!}',
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black45,
              fontStyle: FontStyle.italic,
              fontFamily: 'Roboto',
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color crema = Color(0xFFFFF8E7);
    const Color dorado = Color(0xFFB8860B);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Colonias'),
        backgroundColor: dorado,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Imagen de portada
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/fotocolonia.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),

          const SizedBox(height: 10),
          const Text(
            'Nuestras fragancias más destacadas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B4513),
            ),
          ),
          
          const SizedBox(height: 10),

          // Lista dinámica de perfumes
          Expanded(
            child: ListView.builder(
              itemCount: perfumes.length,
              itemBuilder: (context, index) {
                final perfume = perfumes[index];
                final isExtendedData = index >= 4; // Los últimos 6 tienen datos extendidos
                
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: crema,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(2, 2),
                      ),
                    ],
                    border: isExtendedData 
                      ? Border.all(color: dorado.withOpacity(0.3), width: 1)
                      : null,
                  ),
                  child: InkWell(
                    onTap: () {
                      // Snackbar según lo solicitado por el profesor
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'La visualización detallada se desarrollará en la Fase 3',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                            ),
                          ),
                          duration: const Duration(seconds: 2),
                          backgroundColor: dorado,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          // Imagen del perfume
                          Stack(
                            children: [
                              _buildPerfumeImage(perfume),
                              if (isExtendedData)
                                Positioned(
                                  top: -5,
                                  right: -5,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFB8860B),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.auto_awesome,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          
                          const SizedBox(width: 16),
                          
                          // Información del perfume
                          Expanded(
                            child: _buildPerfumeInfo(perfume),
                          ),
                          
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Botón para volver
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver a inicio'),
              style: ElevatedButton.styleFrom(
                backgroundColor: dorado,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}