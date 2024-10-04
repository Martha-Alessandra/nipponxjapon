class Actividad {
  final String nombreActividad;
  final String ciudad;

  const Actividad({
    required this.nombreActividad,
    required this.ciudad,
  });
}


final List<Actividad> actividades = [
  // TOKYO
  Actividad(nombreActividad: 'SANTUARIO SENSŌJI', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'KAMINARIMON - NAKAMISE DORI', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'ZONA COMERCIAL DE ASAKUSA', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'TOKYO SKYTREE', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'TIENDA POKEMON SKYTREE', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'TOKYO SOLAMACHI', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'PARQUE UENO', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'AMEYA YOKOCHO', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'SHINJUKU', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'OMOIDE YOKOCHO', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'ZONA COMERCIAL DE GINZA (LUXURY SHOPS)', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'ZONA COMERCIAL DE AKIHABARA ELECTRIC TOWN', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'SANTUARIO MEIJI', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'DISTRITO COMERCIAL DE HARAJUKU', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'OMOTESANDO', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'CRUCE DE SHIBUYA', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'MONUMENTO A HACHIKO', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'TIENDA POKEMON DE SHIBUYA', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'TIENDA DE NINTENDO SHIBUYA', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'MEGA DON QUIJOTE', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'ODAIBA', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'GUNDAM DE DIVER CITY', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'PLAYA ODAIBA', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'TEAM LAB PLANETS', ciudad: 'TOKYO'),
  Actividad(nombreActividad: 'PASE GENERAL A DISNEY TOKYO SEA O DISNEY LAND', ciudad: 'TOKYO'),

  // KAMAKURA Y ENOSHIMA
  Actividad(nombreActividad: 'SANTUARIO TSURUGAOKA', ciudad: 'KAMAKURA Y ENOSHIMA'),
  Actividad(nombreActividad: 'KOMACHI DORI STREET', ciudad: 'KAMAKURA Y ENOSHIMA'),
  Actividad(nombreActividad: 'TEMPLO KOTOKU IN', ciudad: 'KAMAKURA Y ENOSHIMA'),
  Actividad(nombreActividad: 'HASE DERA', ciudad: 'KAMAKURA Y ENOSHIMA'),
  Actividad(nombreActividad: 'ISLA DE ENOSHIMA', ciudad: 'KAMAKURA Y ENOSHIMA'),

  // MONTE FUJI
  Actividad(nombreActividad: 'PARQUE ARAKURAYAMA SENGEN', ciudad: 'MONTE FUJI'),
  Actividad(nombreActividad: 'PARQUE OISHI', ciudad: 'MONTE FUJI'),
  Actividad(nombreActividad: 'ANTIGUO PUEBLO JAPONÉS DE OSHINO HAKKAI', ciudad: 'MONTE FUJI'),

  // NIKKO
  Actividad(nombreActividad: 'NIKKO TOSHOGU', ciudad: 'NIKKO'),
  Actividad(nombreActividad: 'CASCADA KEGON', ciudad: 'NIKKO'),
  Actividad(nombreActividad: 'LAGO CHÜZENJI', ciudad: 'NIKKO'),

  // YOKOHAMA
  Actividad(nombreActividad: 'YOKOHAMA RED BRICK WAREHOUSE', ciudad: 'YOKOHAMA'),
  Actividad(nombreActividad: 'OSANBASHI HALL', ciudad: 'YOKOHAMA'),
  Actividad(nombreActividad: 'YOKOHAMA CHINATOWN', ciudad: 'YOKOHAMA'),
  Actividad(nombreActividad: 'CUP NOODLES MUSEUM (SUJETO A CUPO)', ciudad: 'YOKOHAMA'),

  // KYOTO
  Actividad(nombreActividad: 'TEMPLO KIYOZUMI DERA', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'DISTRITO DE GION', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'HOKAN JI', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'TIENDA DE STUDIO GHIBLI', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'STARBUCKS ESTILO JAPONÉS', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'SANNEIZAKA', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'NINENZAKA', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'FUSHIMI INARI TAISHA', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'PABELLON DORADO (KINKAKU JI)', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'ARASHIYAMA (BOSQUE DE BAMBÚ)', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'TOGETSUKYO BRIDGE', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'NISHIKI MARKET', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'SHIJO', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'SANTUARIO YASAKA', ciudad: 'KYOTO'),
  Actividad(nombreActividad: 'PONTOCHO', ciudad: 'KYOTO'),

  // OSAKA
  Actividad(nombreActividad: 'PASE GENERAL A UNIVERSAL STUDIOS JAPAN', ciudad: 'OSAKA'),
  Actividad(nombreActividad: 'CASTILLO BLANCO OSAKA', ciudad: 'OSAKA'),
  Actividad(nombreActividad: 'SHINSEKAI', ciudad: 'OSAKA'),

  // NARA
  Actividad(nombreActividad: 'PARQUE DE NARA', ciudad: 'NARA'),
  Actividad(nombreActividad: 'TODAI JI NANDAIMON (GRAND SOUTH GATE)', ciudad: 'NARA'),
  Actividad(nombreActividad: 'TŌDAI JI BUDA', ciudad: 'NARA'),

  // HIROSHIMA / MIYAJIMA
  Actividad(nombreActividad: 'SANTUARIO ITSUKUSHIMA', ciudad: 'HIROSHIMA / MIYAJIMA'),
  Actividad(nombreActividad: 'DAISHO IN', ciudad: 'HIROSHIMA / MIYAJIMA'),
  Actividad(nombreActividad: 'MONUMENTO DE LA PAZ DE HIROSHIMA', ciudad: 'HIROSHIMA / MIYAJIMA'),
];
