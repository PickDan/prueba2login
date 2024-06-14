import 'package:flutter/material.dart';

void main() {
  runApp(Historial());
}

class Historial extends StatelessWidget {
  const Historial({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventana historial',
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
  double saldo = 5000.0; // Saldo inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de transacciones'),
      ),
      body: Body(saldo: saldo, onSaldoChanged: _actualizarSaldo),
    );
  }

  void _actualizarSaldo(double nuevoSaldo) {
    setState(() {
      saldo = nuevoSaldo;
    });
  }
}

class Body extends StatelessWidget {
  final double saldo;
  final ValueChanged<double> onSaldoChanged;

  const Body({
    required this.saldo,
    required this.onSaldoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Saldo actual: \$${saldo.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Nuevo saldo',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Convertir el valor ingresado a un double
              double nuevoSaldo = double.tryParse(value) ?? 0.0;
              onSaldoChanged(nuevoSaldo);
            },
          ),
        ],
      ),
    );
  }
}
