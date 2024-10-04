class Hospedaje {
  final String nombreHotel;
  final String fecha;
  final String ocupacion;
  final int estrellas;
  final String nochescant;

  const Hospedaje({
    required this.nombreHotel,
    required this.fecha,
    required this.ocupacion,
    required this.estrellas,
    required this.nochescant,
    
  });
}

class HospedajeService {
  // Método que devuelve la lista de hospedajes
  List<Hospedaje> obtenerHospedajes() {
    return const [
      Hospedaje(nombreHotel: 'Hotel en Tokyo', fecha: '1 DE JULIO - 15 DE JULIO', ocupacion: 'Ocupación doble', estrellas: 3, nochescant: '7 noches'),
      Hospedaje(nombreHotel: 'Hotel en Kyoto', fecha: '15 DE JULIO - 29 DE JULIO', ocupacion: 'Ocupación doble', estrellas: 3, nochescant: '8 noches'),
    ];
  }
}


