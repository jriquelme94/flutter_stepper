import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MiStepperState createState() => new _MiStepperState();
}

class _MiStepperState extends State <MyApp> {
  // Variable entera que me servirá para alojar el paso actual de mi Stepper, tomado de la propiedad "currentStep" seteada dentro de mi Stepper.
  int _pasoActual = 0;

  // Declaro una variable List que contendrá todos los pasos que serán trasmitidos a mi Stepper.
  List<Step> misPasos = [
    new Step(
        title: new Text("Preparar ingredientes"),
        content: new Text("1 taza y 1/2 de harina leudante. 360ml de crema. 1 cucharadita de sal. 100gr de queso rallado")
    ),

    new Step(
        title: new Text("Integrar"),
        content: new Text("Agregar la harina, la sal y el queso. Luego batir mientras se agrega la crema.")
    ),

    new Step(
        title: new Text("Amasar"),
        content: new Text("Una vez que todos los ingredientes fueron integrados, amasar por 5min. Luego preparar pequeños bollos y aplastarlos. Finalmente colocalos en una bandeja con harina y pincha los bizcochos")
    ),

    new Step(
        title: new Text("Cocinar"),
        content: new Text("Cocinar en horno medio por 30min y a disfrutar! :D")
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stepper - Receta Bizcochos"),
        backgroundColor: Colors.black,
      ),
      body: new Container(
        child: new Stepper(
          // La propiedad "currentStep" nos indica cual es el paso actual de mi Stepper.
          currentStep: this._pasoActual,
          steps: misPasos,
          // La propiedad "onStepContinue" sirve para indicar lo que sucede cuando se continúa al siguiente paso.
          onStepContinue: (){
            setState(() {
              if (_pasoActual < misPasos.length - 1) {
                _pasoActual = _pasoActual + 1;
              }
              else
              {
                _pasoActual = 0;
              }
            });
          },
          // La propiedad "onStepCancel" sirve para indicar lo que sucede cuando se cancela el paso.
          onStepCancel: (){
            setState(() {
              if (_pasoActual > 0){
                _pasoActual = _pasoActual - 1;
              }
              else{
                _pasoActual = 0;
              }
            });
          },
          // La propiedad "onStepTapped" sirve para indicar lo que sucede cuando se toca un paso sin usar los botones "Continuar" o "Canelar".
          onStepTapped: (step){
            setState(() {
              _pasoActual = step;
              print("Mi paso actual es $step");
            });
          },
        ),
      ),
    );
  }
}