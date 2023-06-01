import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//CONSULTAS Y CONTROLADORES
  void setear() {
    _nameControlador.text = '';
    _proveedorControlador.text = '';
    _cantidadControlador.text = '';
    _precioControlador.text = '';
  }

  final CollectionReference baseDatos =
      FirebaseFirestore.instance.collection('productos');
  //controladores

  final TextEditingController _nameControlador = TextEditingController();
  final TextEditingController _precioControlador = TextEditingController();
  //agregamos mas campos
  final TextEditingController _cantidadControlador = TextEditingController();
  final TextEditingController _proveedorControlador = TextEditingController();

//limpiar el controlador
/*
  void initState() {
    super.initState();

    _nameControlador.addListener(_printLatestValue);
    _proveedorControlador.addListener(_printLatestValue);
    _cantidadControlador.addListener(_printLatestValue);
    _precioControlador.addListener(_printLatestValue);
  }
*/
/*
  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    _nameControlador.dispose();
    _precioControlador.dispose();
    _cantidadControlador.dispose();
    _proveedorControlador.dispose();

    super.dispose();
  }
*/

  /* 
  await _products.add({"name": name, "price": price});
  await _products.update({"name": name, "price": price});
  await _products.doc(productId).delete();
  */

  //consultas

  Future<void> _crear([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //primer label nombre
                TextField(
                  controller: _nameControlador,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                //segundo label proveedor
                TextField(
                  controller: _proveedorControlador,
                  decoration: const InputDecoration(labelText: 'Proveedor'),
                ),

                //tercerlabel precio
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _cantidadControlador,
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                ),
                // cuarto label cantidad
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _precioControlador,
                  decoration: const InputDecoration(labelText: 'precio'),
                ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Registrar nuevo producto'),
                  onPressed: () async {
                    final String name = _nameControlador.text;
                    final String proveedor = _proveedorControlador.text;
                    final double? cantidad =
                        double.tryParse(_cantidadControlador.text);
                    final double? precio =
                        double.tryParse(_precioControlador.text);
                    //2 observacion precio != null

                    if (precio != null) {
                      await baseDatos.add({
                        "name": name,
                        "proveedor": proveedor,
                        "cantidad": cantidad,
                        "precio": precio,
                      });

                      _nameControlador.text = '';
                      _proveedorControlador.text = '';
                      _cantidadControlador.text = '';
                      _precioControlador.text = '';

                      Navigator.of(context).pop();
                      //Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          );
        });
  }

//programado asta aqui
  Future<void> _actualizar([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameControlador.text = documentSnapshot['name'];
      _proveedorControlador.text = documentSnapshot['proveedor'];
      _cantidadControlador.text = documentSnapshot['cantidad'].toString();
      _precioControlador.text = documentSnapshot['precio'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //primer label nombre
                TextField(
                  controller: _nameControlador,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                //segundo label proveedor
                TextField(
                  controller: _proveedorControlador,
                  decoration: const InputDecoration(labelText: 'Proveedor'),
                ),

                //tercerlabel cantidad
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _cantidadControlador,
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                ),
                // cuarto label precui
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _precioControlador,
                  decoration: const InputDecoration(labelText: 'Precio'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('ACTUALIZAR'),
                  onPressed: () async {
                    final String name = _nameControlador.text;
                    final String proveedor = _proveedorControlador.text;
                    final double? cantidad =
                        double.tryParse(_cantidadControlador.text);
                    final double? precio =
                        double.tryParse(_precioControlador.text);
                    //2 observacion precio != null

                    if (precio != null) {
                      await baseDatos.doc(documentSnapshot!.id).update({
                        "name": name,
                        "proveedor": proveedor,
                        "cantidad": cantidad,
                        "precio": precio,
                      });

                      _nameControlador.text = '';
                      _proveedorControlador.text = '';
                      _cantidadControlador.text = '';
                      _precioControlador.text = '';

                      //Navigator.of(context).pop();
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          );
        });
  }
//listo programado asta aqui

  Future<void> _eliminarProducto(String productoId) async {
    await baseDatos.doc(productoId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('As eliminado correctamente el producto')));
  }

  //terminar consultas
//listo programado asta aqui 4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('INVENTARIO DE PRODUCTOS'),
        ),
        body: StreamBuilder(
          stream: baseDatos.snapshots(), //build conexion
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length, // numero de filas
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];

                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      subtitle: Text(documentSnapshot['cantidad'].toString()),
                      /* title: SizedBox(
                          child: Row(
                        children: [
                          ListTile(
                            title: Text(documentSnapshot['name']),
                          ),
                          ListTile(
                            title: Text(documentSnapshot['proveedor']),
                          ),
                          ListTile(
                            title:
                                Text(documentSnapshot['cantidad'].toString()),
                          ),
                          ListTile(
                            title: Text(documentSnapshot['precio'].toString()),
                          )
                        ],
                      )),*/
                      //subtitle: Text(documentSnapshot['cantidad'].toString()),

                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
// Presione este botón para editar un solo producto
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () async {
                                _actualizar(documentSnapshot);
                                setState(() {});
                              },
                            ),

// Este botón de icono se utiliza para eliminar un solo producto
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    _eliminarProducto(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        // boton para agregar nuevo producto
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              setState(() {
                setear();
              });
              _crear();
            },
            child: const Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
