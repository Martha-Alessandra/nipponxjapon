class ActividadPorDia {
  final String dia;
   final String destino;
  final List<String> actividades;
  final String descripcion;

  ActividadPorDia({
    required this.dia,
    required this.destino,
    required this.actividades,
    required this.descripcion,
  });
}


final List<ActividadPorDia> actividadesPorDia = [
  ActividadPorDia(
    dia: 'Día 1',
    destino: 'Asakusa',
    descripcion: 'Llegada a Japón y actividades en Asakusa con transporte privado.',
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
    destino: 'Kamakura y Enoshima',
    descripcion: 'Visitas a Kamakura y Enoshima con paradas en templos y santuarios.',
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
    destino: 'Disney Tokyo Sea / Disneyland Tokyo',
    descripcion: 'Un día en uno de los parques temáticos de Disney en Tokyo.',
    actividades: [
      'Salida al parque de diversiones a las 6:30 AM',
      'Llegada a las 8:00 AM',
      'Explorar las diferentes áreas del parque',
      'Regreso a las 9:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 6',
    destino: 'Harajuku, Shibuya, Shinjuku',
    descripcion: 'Recorrido por las zonas más populares de Tokyo, con visitas a santuarios y tiendas.',
    actividades: [
      'Visitas del día: Santuario Meiji, distrito comercial de Harajuku, Omotesando, cruce de Shibuya, monumento a Hachiko, Shinjuku / Kabukicho',
      'Visitar las tiendas en Shibuya: Tienda Pokémon, Tienda de Nintendo, Mega Don Quijote, Shibuya 109, Magnet by Shibuya 109',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 7',
    destino: 'Día Libre en Yokohama',
    descripcion: 'Día libre con opción de visitar Yokohama (gastos de transporte público por cuenta propia).',
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
    actividades: [
      'Salida a las 2:30 PM',
      'Visita a Nishiki Market',
      'Explorar la zona de Shijo',
      'Regreso al hotel a las 6:00 PM',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 9',
    destino: 'Fushimi Inari, Kinkakuji, Arashiyama, Kiyomizudera',
    descripcion: 'Exploración de Kyoto, visitando templos y santuarios icónicos.',
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
    destino: 'Nara y Osaka',
    descripcion: 'Visitas a los sitios más emblemáticos de Nara y Osaka.',
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
    actividades: [
      'Tomar fotos con kimono o yukata (pagar renta del kimono)',
      'One-day tour a Hiroshima / Miyajima (cubrir costos de transporte)',
    ],
  ),
  ActividadPorDia(
    dia: 'Día 13',
    destino: 'Día Libre Tokyo',
    descripcion: 'Día libre para compras y exploración en Tokio.',
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
    actividades: [
      'Traslado privado de Nippon X Japón',
    ],
  ),
];



