import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/pantallas/ScreenArguments.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  TextEditingController clienteNombreController =
      TextEditingController(text: "");
  TextEditingController clienteApellidoController =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Cliente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Center(
              child: const Text(
                'pagina modificar cliente',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextField(
              controller: clienteNombreController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese la modificacion'),
            ),
            TextField(
              controller: clienteApellidoController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese la modificacion'),
            ),
          ],
        ),
      ),
    );
  }
}
