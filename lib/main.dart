import 'package:flutter/material.dart';
import 'package:widget_dropdownbutton/persona.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Persona> persona = [
    Persona(id: 1, nombre: "Bolivia"),
    Persona(id: 2, nombre: "Perú"),
    Persona(id: 3, nombre: "México"),
  ];
  Persona selectedPersona;
  TextStyle style = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.orange,
              border: Border.all(width: 0.5),
            ),
            child: DropdownButton(
              isExpanded: true,
              value: selectedPersona,
              icon: Icon(Icons.arrow_downward, color: Colors.white),
              iconSize: 24,
              hint: Text('Selecciona un País', style: style),
              style: TextStyle(color: Colors.white),
              onChanged: (newValue) {
                setState(() {
                  selectedPersona = newValue;
                });
              },
              items: persona.map((Persona persona) {
                return DropdownMenuItem<Persona>(
                  value: persona,
                  child: Text(persona.nombre),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
