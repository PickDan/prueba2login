import 'package:flutter/material.dart';
import 'package:prueba2/screens/HistorialScreen.dart';

void main() {
  runApp(Cuenta());
}

class Cuenta extends StatelessWidget {
  const Cuenta({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuenta Bancaria',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Body(),
      Historial(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualización de datos'),
      ),
      body: screens[indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (value) {
          setState(() {
            indice = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Cuenta"),
          BottomNavigationBarItem(icon: Icon(Icons.tsunami), label: "Historial"),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nombreUsuario = "Daniel Ortega";
    String numeroCuenta = "1752523845";
    double valorCuenta = 400.00;
    String imageUrl = "https://th.bing.com/th/id/OIP.9_MptOLxjJEGSGukPt9FWQHaHa?rs=1&pid=ImgDetMain"; 

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 20),
          // Nombre de usuario
          Text(
            'Nombre: $nombreUsuario',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Número de cuenta: $numeroCuenta',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            'Valor total de la cuenta: \$${valorCuenta.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
