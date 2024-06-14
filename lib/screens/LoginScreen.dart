import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prueba2/screens/CuentaScreen.dart';
import 'package:prueba2/screens/RegistroScreen.dart';

void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ventana login',
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
        title: const Text('Login'),
      ),
      body: Body(context),
    );
  }
}

Widget Body(context){
  return(
    Column(
      children: <Widget>[
        Text("Bienvenido a la ventana de inicio de sesión"),
        campoCorreo(context),
        CampoPassword(context),
        BotonLogin(context),
        BotonirRegistro(context)
      ],
    )    
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

Widget BotonLogin(context) {
  return ElevatedButton(
    onPressed: () {
      login(context);
    },
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      "Iniciar sesión",
      style: TextStyle(fontSize: 16),
    ),
  );
}

Widget BotonirRegistro(context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Registro()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: const Text(
      "Ir a Registro",
      style: TextStyle(fontSize: 16),
    ),
  );
}
//funcion login
////////////////////////////////////
///Inicializar app
Future<void> login(context) async {
  try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _correo.text,
    password: _password.text
  );
/////////////////////////////////////////////////
      Navigator.push(context, 
        MaterialPageRoute(builder: 
          (context) => Cuenta()
        )
      );
///
//////////////////////////////////////////////

} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return errorCredenciales(context);
      },
    );
    errorCredenciales(context);
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return errorCredenciales(context);
      },
    );
  }
}
}

Widget errorCredenciales(context) {
  return AlertDialog(
    title: Text('Credenciales incorrectas'),
    content: Text('El correo electrónico o la contraseña son incorrectos. Por favor, inténtalo de nuevo.'),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          
        },
        child: Text('OK'),
      ),
    ],
  );
}
