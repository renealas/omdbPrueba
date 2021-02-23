import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pelicula.dart';
import '../providers/peliculas.dart';
import '../widgets/pelicula_item.dart';

class PeliculaList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final peliculasData = Provider.of<Peliculas>(context);
    final peliculasCargadas = peliculasData.items;
    return ListView.builder(
      //padding: const EdgeInsets.all(10.0),
      itemCount: peliculasCargadas.length,
      itemBuilder: (ctx, i) => PeliculaItem(
        peliculasCargadas[i].imdbID,
        peliculasCargadas[i].title,
        peliculasCargadas[i].type,
        peliculasCargadas[i].year,
        peliculasCargadas[i].poster,
        peliculasCargadas[i].plot,
        peliculasCargadas[i].imdbRating,
        peliculasCargadas[i].metaScore,
      ),
    );
  }
}
