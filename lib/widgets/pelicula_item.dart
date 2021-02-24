import 'package:flutter/material.dart';
import '../screens/pelicula_detail_screen.dart';

class PeliculaItem extends StatelessWidget {
  final String imdbID;
  final String title;
  final String type;
  final String year;
  final String poster;

  PeliculaItem(this.imdbID, this.title, this.type, this.year, this.poster);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(poster),
      ),
      title: Text(
        title,
        textAlign: TextAlign.start,
      ),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[Text(type + ' - '), Text(year)],
      ),
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => PeliculaDetailScreen(imdbID)),
        ),
      },
    );
  }
}
