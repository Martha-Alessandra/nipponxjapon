class Vuelo {
  final String fecha;
  final String estado;

  Vuelo({
    required this.fecha,
    required this.estado,
  });
}

final List<Vuelo> vuelos = [
  Vuelo(fecha: '5 DE MARZO - 19 DE MARZO', estado: 'AGOTADO'),
  Vuelo(fecha: '19 DE MARZO - 2 DE ABRIL', estado: 'AGOTADO'),
  Vuelo(fecha: '2 DE ABRIL - 16 DE ABRIL', estado: 'AGOTADO'),
  Vuelo(fecha: '16 DE ABRIL - 30 DE ABRIL', estado: 'AGOTADO'),
  Vuelo(fecha: '1 DE JULIO - 15 DE JULIO', estado: 'PREVENTA'),
  Vuelo(fecha: '15 DE JULIO - 29 DE JULIO', estado: 'PREVENTA'),
  Vuelo(fecha: '01 DE OCTUBRE - 15 DE OCTUBRE', estado: 'EN ESPERA'),
  Vuelo(fecha: '15 DE OCTUBRE - 29 DE OCTUBRE', estado: 'EN ESPERA'),
  Vuelo(fecha: '29 DE OCTUBRE - 12 DE NOVIEMBRE', estado: 'EN ESPERA'),
  Vuelo(fecha: '12 DE NOVIEMBRE - 26 DE NOVIEMBRE', estado: 'EN ESPERA'),
];

