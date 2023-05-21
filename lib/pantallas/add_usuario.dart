import 'package:flutter/material.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController clienteIdController = TextEditingController(text: "");
  TextEditingController clienteNombreController =
      TextEditingController(text: "");
  TextEditingController clienteApellidoController =
      TextEditingController(text: "");
  TextEditingController clienteCiudadController =
      TextEditingController(text: "");
  TextEditingController clienteDireccionController =
      TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("agregar cliente"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                'pagina agregar cliente',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextField(
              controller: clienteIdController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese el id del cliente'),
            ),
            TextField(
              controller: clienteNombreController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese el nombre del cliente'),
            ),
            TextField(
              controller: clienteApellidoController,
              decoration: const InputDecoration(
                  hintText: 'Ingrese el Apellido del cliente'),
            ),
            TextField(
              controller: clienteCiudadController,
              decoration: const InputDecoration(hintText: 'Ingrese la ciudad'),
            ),
            TextField(
              controller: clienteDireccionController,
              decoration:
                  const InputDecoration(hintText: 'Ingrese la dirección'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await agregarCliente(
                          clienteApellidoController.text,
                          clienteCiudadController.text,
                          clienteDireccionController.text,
                          clienteIdController.text,
                          clienteNombreController.text)
                      .then((_) {});
                  Navigator.pop(context);
                },
                child: const Text("Guardar")),
          ],
        ),
      ),
    );
  }
}
