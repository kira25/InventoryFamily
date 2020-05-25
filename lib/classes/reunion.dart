import 'package:calculator/classes/persona.dart';

class Reunion {
  List<Persona> _family = [
    Persona(
        nombre: 'Erick Gutierrez',
        edad: 26,
        email: 'erick.gutierrez@pucp.pe',
        phoneNumber: 995219921),
    Persona(
        nombre: 'Diego Gutierrez',
        edad: 32,
        email: 'abc@pucp.pe',
        phoneNumber: 958219392),
    Persona(
        nombre: 'Holkar Gutierrez',
        edad: 34,
        email: 'def@pucp.pe',
        phoneNumber: 967028694),
    Persona(
        nombre: 'Papa', edad: 40, email: 'qwe@pucp.pe', phoneNumber: 996870186),
    Persona(
        nombre: 'Mama', edad: 40, email: 'lho@pucp.pe', phoneNumber: 950486058),
  ];

  String getMemberName(int _numberMember) {
    return _family[_numberMember].nombre;
  }

  int getMemberEdad(int _numberMember) {
    return _family[_numberMember].edad;
  }

  String getMemberEmail(int _numberMember) {
    return _family[_numberMember].email;
  }

  int getMemberphoneNumber(int _numberMember) {
    return _family[_numberMember].phoneNumber;
  }
}
