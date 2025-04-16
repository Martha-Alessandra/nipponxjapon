class ActividadPorDia {
  final String dia;
  final String destino;
  final List<String> images;
  final List<String> actividades;
  final String descripcion;

  ActividadPorDia({
    required this.dia,
    required this.destino,
    required this.images,
    required this.actividades,
    required this.descripcion,
  });
}


final List<ActividadPorDia> actividadesPorDia = [
  ActividadPorDia(
    dia: 'Día 1',
    destino: 'Asakusa',
    descripcion: 'Llegada a Japón y actividades en Asakusa con transporte privado.',
    images: ['assets/images/destinos/asakusa.jpg'],
    actividades: [
      'Autobús privado de Nippon X Japón',
      'Llegada al aeropuerto a las 6:20 AM',
      'Llegada al hotel a las 9:30 AM aproximadamente',
      'Dejar maletas en el hotel',
      'Visita al Santuario Sensō-ji',
      'Recorrido por Kaminarimon - Nakamise Dori',
      'Explorar la zona comercial de Asakusa',
      'Visita a Odaiba / Diver City',
      'Experiencia en TeamLab Planets',
      'Regreso al hotel a las 6:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 2',
    destino: 'NIKKO',
    descripcion: 'Exploración de Nikko con transporte privado y visitas a lugares históricos.',
    images: ['assets/images/destinos/Nikko.jpg'],
    actividades: [
      'Autobús privado de Nippon X Japón',
      'Reunión en el lobby a las 6:30 AM',
      'Salida del autobús a las 8:30 AM',
      'Visita a Nikko Tosho-gu',
      'Cascada Kegon',
      'Lake Chūzenji',
      'Regreso a las 6:00 PM',
      'Visita a Ginza',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 3 ',
    destino: 'Kamakura - Enoshima',
    descripcion: 'Visitas a Kamakura y Enoshima con paradas en templos y santuarios.',
    images: ['assets/images/destinos/Kamakura.jpg', 'assets/images/destinos/Enoshima.jpg'],
    actividades: [
      'Autobús privado de Nippon X Japón',
      'Reunión en el lobby a las 6:30 AM',
      'Salida del autobús a las 8:30 AM',
      'Santuario Tsurugaoka Hachiman-gu',
      'Komachi-dori Street',
      'Great Buddha (Daibutsu)',
      'Hase Dera Temple',
      'Enoshima',
      'Regreso a las 6:00 PM',
      'Visita a Akihabara',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 4',
    destino: 'Monte Fuji',
    descripcion: 'Día completo para explorar el Monte Fuji y sus alrededores.',
    images: ['assets/images/destinos/MonteFuji.jpg'],
    actividades: [
      'Autobús privado de Nippon X Japón',
      'Reunión en el lobby a las 6:30 AM',
      'Salida del autobús a las 8:30 AM',
      'Parque Arakurayama Sengen',
      'Parque Oishi',
      'Oshino Hakkai Town',
      'Regreso a las 6:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 5',
    destino: 'Disney Tokyo Sea - Disneyland Tokyo',
    descripcion: 'Un día en uno de los parques temáticos de Disney en Tokyo.',
    images: ['assets/images/destinos/DisneyTokioSea.jpg', 'assets/images/destinos/DisneylandTokio.jpg'],
    actividades: [
      'Salida al parque de diversiones a las 6:30 AM',
      'Llegada a las 8:00 AM',
      'Explorar las diferentes áreas del parque',
      'Regreso a las 9:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 6',
    destino: 'Harajuku - Shibuya - Shinjuku',
    descripcion: 'Recorrido por las zonas más populares de Tokyo, con visitas a santuarios y tiendas.',
    images: [
      'assets/images/destinos/Harajuku.jpg',
      'assets/images/destinos/Shibuya.jpg',
      'assets/images/destinos/Shinjuku.jpg',
    ],
    actividades: [
      'Visitas del día: Santuario Meiji, distrito comercial de Harajuku, Omotesando, cruce de Shibuya, monumento a Hachiko, Shinjuku / Kabukicho',
      'Visitar las tiendas en Shibuya: Tienda Pokémon, Tienda de Nintendo, Mega Don Quijote, Shibuya 109, Magnet by Shibuya 109',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 7',
    destino: 'Día Libre en Yokohama',
    descripcion: 'Día libre con opción de visitar Yokohama (gastos de transporte público por cuenta propia).',
    images: ['assets/images/destinos/yokohama.jpg'],
    actividades: [
      'Visitar Yokohama Red Brick Warehouse',
      'Osanbashi Hall',
      'Yokohama Chinatown',
      'Cup Noodles Museum (sujeto a cupo)',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 8',
    destino: 'Kyoto',
    descripcion: 'Visita opcional a Kyoto con paradas en Nishiki Market y la zona de Shijo.',
    images: ['assets/images/destinos/Kyoto.jpg'],
    actividades: [
      'Salida a las 2:30 PM',
      'Visita a Nishiki Market',
      'Explorar la zona de Shijo',
      'Regreso al hotel a las 6:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 9',
    destino: 'Fushimi Inari - Kinkakuji\nArashiyama - Kiyomizudera',
    descripcion: 'Exploración de Kyoto, visitando templos y santuarios icónicos.',
    images: [
      'assets/images/destinos/FushimiInari.jpg',
      'assets/images/destinos/Kinkakuji.jpg',
      'assets/images/destinos/Arashiyama.jpg',
      'assets/images/destinos/kiyomizudera.jpg',
    ],
    actividades: [
      'Autobús privado de Nippon X Japón',
      'Reunión en el lobby a las 6:30 AM',
      'Salida del autobús a las 8:30 AM',
      'Arashiyama',
      'Kiyomizudera',
      'Pabellón Dorado',
      'Fushimi Inari Taisha',
      'Regreso a las 6:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 10',
    destino: 'Nara - Osaka',
    descripcion: 'Visitas a los sitios más emblemáticos de Nara y Osaka.',
    images: [
      'assets/images/destinos/Nara.jpg',
      'assets/images/destinos/Osaka.jpg',
    ],
    actividades: [
      'Autobús privado de Nippon X Japón',
      'Salida para tomar el tren a las 8:00 AM',
      'Parque de Nara',
      'Tōdai-ji Nandaimon (Grand South Gate)',
      'Tōdai-ji Buda',
      'Castillo de Osaka',
      'Shinsekai',
      'Regreso a las 6:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 11',
    destino: 'Universal Studios',
    descripcion: 'Día completo en Universal Studios Osaka.',
    images: ['assets/images/destinos/UniversalStudio.jpg'],
    actividades: [
      'Salida a las 6:30 AM',
      'Explorar Universal Studios Osaka',
      'Regreso a las 8:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 12',
    destino: 'Día Libre Kyoto',
    descripcion: 'Opción de actividades adicionales o tour de un día a Hiroshima/Miyajima.',
    images: ['assets/images/destinos/Kyoto.jpg'],
    actividades: [
      'Tomar fotos con kimono o yukata (pagar renta del kimono)',
      'One-day tour a Hiroshima / Miyajima (cubrir costos de transporte)',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 13',
    destino: 'Día Libre Tokyo',
    descripcion: 'Día libre para compras y exploración en Tokio.',
    images: ['assets/images/destinos/Tokio.jpg'],
    actividades: [
      'Llegada a Tokio a las 11:00 AM',
      'Check-in en el hotel a las 3:00 PM',
      'Explorar Tokio y hacer compras',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 14',
    destino: 'Regreso al Aeropuerto',
    descripcion: 'Traslado al aeropuerto con transporte privado.',
    images: ['assets/images/destinos/Aeropuerto.jpg'],
    actividades: [
      'Traslado privado de Nippon X Japón',
    ],
  ),
];