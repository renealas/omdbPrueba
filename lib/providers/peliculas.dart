import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pelicula.dart';
import '../models/peliculaDetail.dart';

class Peliculas with ChangeNotifier {
  List<Pelicula> _items = [
    Pelicula(
      imdbID: "tt0848228",
      title: "The Avengers",
      type: "movie",
      year: "2012",
      poster:
          "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
    ),
    Pelicula(
      imdbID: "tt4154796",
      title: "Avengers: Endgame",
      type: "movie",
      year: "2019",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
    ),
    Pelicula(
      imdbID: "tt9140560",
      title: "WandaVision",
      type: "series",
      year: "2021",
      poster:
          "https://m.media-amazon.com/images/M/MV5BYjJiZmE5ZDgtYWUxZi00MWI1LTg2MmEtZmUwZGE2YzRkNTE5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
    ),
    Pelicula(
      imdbID: "tt3322314",
      title: "Luke Cage",
      type: "series",
      year: "2016–2018",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMjAxOTM3NjEwMV5BMl5BanBnXkFtZTgwNTkyOTY4NTM@._V1_SX300.jpg",
    )
  ];

  List<Pelicula> get items {
    return [..._items];
  }

  List<PeliculaDetail> _item = [
    PeliculaDetail(
      imdbID: "tt3322314",
      title: "Luke Cage",
      type: "series",
      year: "2016–2018",
      poster:
          "https://m.media-amazon.com/images/M/MV5BMjAxOTM3NjEwMV5BMl5BanBnXkFtZTgwNTkyOTY4NTM@._V1_SX300.jpg",
      imdbRating: "8.0",
      metaScore: "69",
      plot:
          "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.",
    )
  ];

  List<PeliculaDetail> get item {
    return [..._item];
  }

  Future<void> fetchAndSetPeliculas(title, tipo) async {
    var url;
    if (tipo == 'none') {
      url = 'http://www.omdbapi.com/?apikey=262abddd&s=$title';
    } else {
      url = 'http://www.omdbapi.com/?apikey=262abddd&s=$title&type=$tipo';
    }
    if (title == '') {
      _items = [
        Pelicula(
          imdbID: "tt0848228",
          title: "The Avengers",
          type: "movie",
          year: "2012",
          poster:
              "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
        ),
        Pelicula(
          imdbID: "tt4154796",
          title: "Avengers: Endgame",
          type: "movie",
          year: "2019",
          poster:
              "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
        ),
        Pelicula(
          imdbID: "tt9140560",
          title: "WandaVision",
          type: "series",
          year: "2021",
          poster:
              "https://m.media-amazon.com/images/M/MV5BYjJiZmE5ZDgtYWUxZi00MWI1LTg2MmEtZmUwZGE2YzRkNTE5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
        ),
        Pelicula(
          imdbID: "tt3322314",
          title: "Luke Cage",
          type: "series",
          year: "2016–2018",
          poster:
              "https://m.media-amazon.com/images/M/MV5BMjAxOTM3NjEwMV5BMl5BanBnXkFtZTgwNTkyOTY4NTM@._V1_SX300.jpg",
        )
      ];
      notifyListeners();
    }

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      final List<Pelicula> loadedPeliculas = [];
      final size = extractedData.length;
      for (var i = 0; i < size; i++) {
        loadedPeliculas.add(Pelicula(
          imdbID: extractedData['Search'][i]['imdbID'],
          poster: extractedData['Search'][i]['Poster'],
          title: extractedData['Search'][i]['Title'],
          type: extractedData['Search'][i]['Type'],
          year: extractedData['Search'][i]['Year'],
        ));
      }
      _items = loadedPeliculas.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> fetchPeliculaDetail(id) async {
    var url = 'http://www.omdbapi.com/?apikey=262abddd&i=$id';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      }
      final List<PeliculaDetail> loadedPelicula = [];
      final size = extractedData.length;
      loadedPelicula.add(PeliculaDetail(
          imdbID: extractedData['imdbID'],
          imdbRating: extractedData['imdbRating'],
          metaScore: extractedData['Metascore'],
          plot: extractedData['Plot'],
          poster: extractedData['Poster'],
          title: extractedData['Title'],
          type: extractedData['Type'],
          year: extractedData['Year']));
      _item = loadedPelicula.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
