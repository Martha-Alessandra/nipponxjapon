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
  const Actividad(nombreActividad: 'SANTUARIO SENSŌJI', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'ZONA COMERCIAL DE ASAKUSA', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'TOKYO SKYTREE', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'TIENDA POKEMON SKYTREE', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'TOKYO SOLAMACHI', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'PARQUE UENO', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'AMEYA YOKOCHO', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'SHINJUKU', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'OMOIDE YOKOCHO', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'ZONA COMERCIAL DE GINZA (LUXURY SHOPS)', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'KAMINARIMON - NAKAMISE DORI', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'ZONA COMERCIAL DE AKIHABARA ELECTRIC TOWN', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'SANTUARIO MEIJI', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'DISTRITO COMERCIAL DE HARAJUKU', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'OMOTESANDO', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'CRUCE DE SHIBUYA', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'MONUMENTO A HACHIKO', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'TIENDA POKEMON DE SHIBUYA', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'TIENDA DE NINTENDO SHIBUYA', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'MEGA DON QUIJOTE', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'ODAIBA', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'GUNDAM DE DIVER CITY', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'PLAYA ODAIBA', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'TEAM LAB PLANETS', ciudad: 'TOKYO'),
  const Actividad(nombreActividad: 'PASE GENERAL A DISNEY TOKYO SEA O DISNEY LAND', ciudad: 'TOKYO'),

  // KAMAKURA Y ENOSHIMA
  const Actividad(nombreActividad: 'SANTUARIO TSURUGAOKA', ciudad: 'KAMAKURA Y ENOSHIMA'),
  const Actividad(nombreActividad: 'KOMACHI DORI STREET', ciudad: 'KAMAKURA Y ENOSHIMA'),
  const Actividad(nombreActividad: 'TEMPLO KOTOKU IN', ciudad: 'KAMAKURA Y ENOSHIMA'),
  const Actividad(nombreActividad: 'HASE DERA', ciudad: 'KAMAKURA Y ENOSHIMA'),
  const Actividad(nombreActividad: 'ISLA DE ENOSHIMA', ciudad: 'KAMAKURA Y ENOSHIMA'),

  // MONTE FUJI
  const Actividad(nombreActividad: 'PARQUE ARAKURAYAMA SENGEN', ciudad: 'MONTE FUJI'),
  const Actividad(nombreActividad: 'PARQUE OISHI', ciudad: 'MONTE FUJI'),
  const Actividad(nombreActividad: 'ANTIGUO PUEBLO JAPONÉS DE OSHINO HAKKAI', ciudad: 'MONTE FUJI'),

  // NIKKO
  const Actividad(nombreActividad: 'NIKKO TOSHOGU', ciudad: 'NIKKO'),
  const Actividad(nombreActividad: 'CASCADA KEGON', ciudad: 'NIKKO'),
  const Actividad(nombreActividad: 'LAGO CHÜZENJI', ciudad: 'NIKKO'),

  // YOKOHAMA
  const Actividad(nombreActividad: 'YOKOHAMA RED BRICK WAREHOUSE', ciudad: 'YOKOHAMA'),
  const Actividad(nombreActividad: 'OSANBASHI HALL', ciudad: 'YOKOHAMA'),
  const Actividad(nombreActividad: 'YOKOHAMA CHINATOWN', ciudad: 'YOKOHAMA'),
  const Actividad(nombreActividad: 'CUP NOODLES MUSEUM (SUJETO A CUPO)', ciudad: 'YOKOHAMA'),

  // KYOTO
  const Actividad(nombreActividad: 'TEMPLO KIYOZUMI DERA', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'DISTRITO DE GION', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'HOKAN JI', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'TIENDA DE STUDIO GHIBLI', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'STARBUCKS ESTILO JAPONÉS', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'SANNEIZAKA', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'NINENZAKA', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'FUSHIMI INARI TAISHA', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'PABELLON DORADO (KINKAKU JI)', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'ARASHIYAMA (BOSQUE DE BAMBÚ)', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'TOGETSUKYO BRIDGE', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'NISHIKI MARKET', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'SHIJO', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'SANTUARIO YASAKA', ciudad: 'KYOTO'),
  const Actividad(nombreActividad: 'PONTOCHO', ciudad: 'KYOTO'),

  // OSAKA
  const Actividad(nombreActividad: 'PASE GENERAL A UNIVERSAL STUDIOS JAPAN', ciudad: 'OSAKA'),
  const Actividad(nombreActividad: 'CASTILLO BLANCO OSAKA', ciudad: 'OSAKA'),
  const Actividad(nombreActividad: 'SHINSEKAI', ciudad: 'OSAKA'),

  // NARA
  const Actividad(nombreActividad: 'PARQUE DE NARA', ciudad: 'NARA'),
  const Actividad(nombreActividad: 'TODAI JI NANDAIMON (GRAND SOUTH GATE)', ciudad: 'NARA'),
  const Actividad(nombreActividad: 'TŌDAI JI BUDA', ciudad: 'NARA'),

  // HIROSHIMA / MIYAJIMA
  const Actividad(nombreActividad: 'SANTUARIO ITSUKUSHIMA', ciudad: 'HIROSHIMA / MIYAJIMA'),
  const Actividad(nombreActividad: 'DAISHO IN', ciudad: 'HIROSHIMA / MIYAJIMA'),
  const Actividad(nombreActividad: 'MONUMENTO DE LA PAZ DE HIROSHIMA', ciudad: 'HIROSHIMA / MIYAJIMA'),
];
