import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/peliculasList.dart';
import '../providers/peliculas.dart';
import '../widgets/footer.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchTextController = new TextEditingController();
  String searchText = "";
  bool serie = false;
  bool pelicula = false;
  String tipo = '';

  @override
  void dispose() {
    //Borramos el Controlador de Texto al Finalizar Busqueda
    searchTextController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Provider.of<Peliculas>(context, listen: false)
    //     .fetchAndSetPeliculas('Avengers');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: searchTextController,
                decoration:
                    InputDecoration(hintText: 'Entre el Titulo de Pelicula'),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                    height: 10,
                  ),
                Text(
                  'Serie:',
                  style: TextStyle(fontSize: 14),
                ),
                Checkbox(value: serie, onChanged: (bool value) {
                  setState(() {
                    serie = value;
                  });
                  if(serie){
                    setState(() {
                      tipo = 'series';
                    });
                  }
                }),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                    height: 10,
                  ),
                Text(
                  'Peliculas:',
                  style: TextStyle(fontSize: 14),
                ),
                Checkbox(value: pelicula, onChanged: (bool value) {
                  setState(() {
                    pelicula = value;
                  });
                  if(pelicula){
                    setState(() {
                      tipo = 'movie';
                    });
                  }
                }),
              ],
            ),
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Buscar Peliculas',
              onPressed: () {
                setState(() {
                  //Pone el Estado nuevo
                  searchText = searchTextController.text;
                  //Esconde el Teclado
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  Provider.of<Peliculas>(context, listen: false)
                      .fetchAndSetPeliculas(searchText, tipo);
                  setState(() {
                    tipo = 'none';
                    pelicula = false;
                    serie = false;
                  });
                });
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: 'Entretenimiento'),
                        Tab(text: 'Amigos'),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                          child: Center(
                            child: PeliculaList(),
                          ),
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              'Info de Amigos',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
