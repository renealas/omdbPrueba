import 'package:flutter/material.dart';
import 'package:imdb/widgets/footer.dart';
import 'package:provider/provider.dart';

import '../providers/peliculas.dart';
import '../widgets/pelicula_detail.dart';

class PeliculaDetailScreen extends StatefulWidget {
  final String imdbID;

  PeliculaDetailScreen(this.imdbID);

  @override
  _PeliculaDetailScreenState createState() => _PeliculaDetailScreenState();
}

class _PeliculaDetailScreenState extends State<PeliculaDetailScreen> {
  @override
  void initState() {
  Provider.of<Peliculas>(context, listen: false).fetchPeliculaDetail(widget.imdbID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: PeliculaDetail(),

      //Esto es para poner el footer en las apps.
      bottomNavigationBar: Footer(),
    );
  }
}

