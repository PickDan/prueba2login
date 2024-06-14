import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba2/screens/LoginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Prueba2());
}

class Prueba2 extends StatelessWidget {
  const Prueba2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplicación seguridad',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context){
   return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Sebastián Pilamunga", style: TextStyle(fontSize: 20))),
        Center(child: Text("PickDan", style: TextStyle(fontSize: 20))),
        BotonLogin(context)
      ],
    );
}

Widget BotonLogin(context){
  return ElevatedButton(
      onPressed: () {
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => const Login()),
        );
      },
      child: Text("Ir al login"),
    );
}



// Contendrá la clase principal y deberá tener lo siguiente:
// • Nombre del estudiante
// • Usuario de GitHub
// • Botón: Al presionar el botón se redirigirá a la ventana de Login.