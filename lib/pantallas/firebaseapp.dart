import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebaseapp/pantallas/add_usuario.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';

class FireBaseAPP extends StatefulWidget {
  const FireBaseAPP({super.key});

  @override
  State<FireBaseAPP> createState() => _FireBaseAPPState();
}

class _FireBaseAPPState extends State<FireBaseAPP> {
  @override
  //_llave =UniqueKey();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarS(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder(
          future: getClientes(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    return Dismissible(
                      confirmDismiss: (direction) async {
                        print("Confirmacion de borrado");
                        return true;
                      },
                      background: Container(
                        color: (Colors.red),
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      child: ListTile(
                        title: Text("id: " +
                            snapshot.data?[index]['id_cliente'] +
                            "\n" +
                            snapshot.data?[index]['nombreCliente'] +
                            " " +
                            snapshot.data?[index]['ApellidoCliente'] +
                            "\n" +
                            snapshot.data?[index]['CiudadCliente'] +
                            " " +
                            snapshot.data?[index]['DireccionCliente'] +
                            "\n" +
                            "________________________"),
                        onTap: () async {
                          Navigator.of(context).pushNamed("/add", arguments: {
                            'nombreCliente': snapshot.data?[index]
                                ['nombreCliente']
                          });
                          setState(() {});
                        },
                      ),
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }

  AppBarS() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 5,
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Parcial 4",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                IconButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddUser(),
                              ))
                        },
                    icon: Icon(Icons.add))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
