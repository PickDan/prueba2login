import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba2/screens/LoginScreen.dart';

void main() {
  runApp(Registro());
}

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventana Registro',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventana registro'),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context) {
  return Column(
    children: <Widget>[
      Text("Bienvenido a la ventana de registrarse"),
      CampoUsuario(context),
      campoCorreo(context),
      CampoPassword(context),
      BotonRegistro(context),
    ],
  );
}

final TextEditingController _nick = TextEditingController();
Widget CampoUsuario(context) {
  return TextField(
    controller: _nick,
    obscureText: true,
    decoration: InputDecoration(
      hintText: "Ingrese su nickname",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    ),
  );
}

final TextEditingController _correo = TextEditingController();
Widget campoCorreo(context) {
  return TextField(
    controller: _correo,
    decoration: InputDecoration(
      hintText: "Ingrese su correo",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    ),
  );
}

final TextEditingController _password = TextEditingController();
Widget CampoPassword(context) {
  return TextField(
    controller: _password,
    obscureText: true,
    decoration: InputDecoration(
      hintText: "Ingrese su contraseña",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    ),
  );
}

Widget BotonRegistro(context) {
  return ElevatedButton(
    onPressed: () async {
      await registro(context);
      await guardar();
    },
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      "Registrarse",
      style: TextStyle(fontSize: 16),
    ),
  );
}

Future<void> guardar() async {
DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/" + _nick.text);

  await ref.set({
    "nick": _nick.text
  });
}

Future<void> registro(context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _correo.text,
      password: _password.text,
    );

    // Si la autenticación es exitosa, navega a la pantalla de inicio de sesión
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
