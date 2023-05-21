import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore baseD = FirebaseFirestore.instance;
Future<List> getUsuarios() async {
  List usuarios = [];
  CollectionReference collectionReferenceUsuarios =
      baseD.collection('usuarios');
  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();
  queryUsuarios.docs.forEach((documento) {
    usuarios.add(documento.data());
  });

  return usuarios;
}

//guardar usuario
Future<void> agregarUsuario(String usuario) async {
  await baseD.collection('usuarios').add({"nombre": usuario});
}

Future<List> getClientes() async {
  List clientes = [];
  CollectionReference collectionReferenceClientes =
      baseD.collection('clientes');
  QuerySnapshot queryClientes = await collectionReferenceClientes.get();
  queryClientes.docs.forEach((documento) {
    clientes.add(documento.data());
  });
  return clientes;
}

Future<void> agregarCliente(String apellido, String ciudad, String direccion,
    String id, String cliente) async {
  await baseD.collection('clientes').add({
    "ApellidoCliente": apellido,
    "CiudadCliente": ciudad,
    "DireccionCliente": direccion,
    "id_cliente": id,
    "nombreCliente": cliente
  });
}
