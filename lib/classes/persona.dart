class Persona {
  String nombre;
  int edad;
  String email;
  int phoneNumber;

  Persona({this.nombre, this.edad, this.email, this.phoneNumber});
}

class Tono extends Persona {
  String musicStyle;
  List<String> items;
  double presupuesto;

  Tono(
      {String nombre,
      int edad,
      String email,
      int phoneNumber,
      this.musicStyle,
      this.items,
      this.presupuesto})
      : super() {
    this.musicStyle = musicStyle;
    this.items = items;
    this.presupuesto = presupuesto;
  }
}
