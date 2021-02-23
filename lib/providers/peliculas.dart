import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/pelicula.dart';

class Peliculas with ChangeNotifier {
  List<Pelicula> _items = [
    Pelicula(
        imdbID: "tt0848228",
        title: "The Avengers",
        type: "movie",
        year: "2012",
        poster:
            "https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg",
        plot:
            "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.",
        imdbRating: "8.0",
        metaScore: "69"),
    Pelicula(
        imdbID: "tt4154796",
        title: "Avengers: Endgame",
        type: "movie",
        year: "2019",
        poster:
            "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
        plot:
            "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
        imdbRating: "8.4",
        metaScore: "78"),
    Pelicula(
        imdbID: "tt9140560",
        title: "WandaVision",
        type: "series",
        year: "2021",
        poster:
            "https://m.media-amazon.com/images/M/MV5BYjJiZmE5ZDgtYWUxZi00MWI1LTg2MmEtZmUwZGE2YzRkNTE5XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg",
        plot:
            "Blends the style of classic sitcoms with the MCU in which Wanda Maximoff and Vision -two super-powered beings living their ideal suburban lives-begin to suspect that everything is not as it seems.",
        imdbRating: "8.0",
        metaScore: "N/A"),
    Pelicula(
        imdbID: "tt3322314",
        title: "Luke Cage",
        type: "series",
        year: "2016–2018",
        poster:
            "https://m.media-amazon.com/images/M/MV5BMjAxOTM3NjEwMV5BMl5BanBnXkFtZTgwNTkyOTY4NTM@._V1_SX300.jpg",
        plot:
            "When a sabotaged experiment gives him super strength and unbreakable skin, Luke Cage becomes a fugitive attempting to rebuild his life in Harlem and must soon confront his past and fight a battle for the heart of his city.",
        imdbRating: "7.3",
        metaScore: "N/A")
  ];

  List<Pelicula> get items {
    return [..._items];
  }

  Future<void> fetchAndSetPeliculas(title, tipo) async {
    var url = 'http://www.omdbapi.com/?apikey=262abddd&t=$title&type=$tipo';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if(extractedData == null){
        return;
      }
      final List<Pelicula> loadedPeliculas = [];
      final size = extractedData.length;
      print(size);
      print(extractedData);
        loadedPeliculas.add(Pelicula(
          imdbID: extractedData['imdbID'],
          imdbRating: extractedData['imdbRating'],
          metaScore: extractedData['Metascore'],
          plot: extractedData['Plot'],
          poster: extractedData['Poster'],
          title: extractedData['Title'],
          type: extractedData['Type'],
          year: extractedData['Year']
        ));
      _items = loadedPeliculas.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
