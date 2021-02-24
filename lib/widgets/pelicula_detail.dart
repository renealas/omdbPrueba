import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:customgauge/customgauge.dart';

import '../providers/peliculas.dart';

class PeliculaDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     final peliculaData = Provider.of<Peliculas>(context);
     final pelicula = peliculaData.item;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 150,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Container(
              child: Text(
                pelicula[0].title,
                style: TextStyle(backgroundColor: Colors.black54),
                textAlign: TextAlign.left,
              ),
              alignment: Alignment.bottomLeft,
            ),
            background: Hero(
              tag: pelicula[0].imdbID,
              child: Image.network(
                pelicula[0].poster,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Adonde Ver',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 170,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Elenco & Equipo',
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: RaisedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(Icons.play_arrow),
                              Text(
                                'Trailer',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tipo: ' + pelicula[0].type,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pelicula[0].plot,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    softWrap: true,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.black),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),
                    CustomGauge(
                      gaugeSize: 100,
                      segments: [
                        GaugeSegment('Low', 20, Colors.red),
                        GaugeSegment('Medium', 40, Colors.orange),
                        GaugeSegment('High', 40, Colors.green),
                      ],
                      currentValue: double.parse(pelicula[0].imdbRating) * 10,
                      displayWidget:
                          Text('IMDB', style: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    CustomGauge(
                      gaugeSize: 100,
                      segments: [
                        GaugeSegment('Low', 20, Colors.red),
                        GaugeSegment('Medium', 40, Colors.orange),
                        GaugeSegment('High', 40, Colors.green),
                      ],
                      currentValue: pelicula[0].metaScore == 'N/A'
                          ? 0.00
                          : double.parse(
                              pelicula[0].metaScore), //double.parse(metaScore == 'N/A' ? 0.00 : metaScore),
                      displayWidget:
                          Text('My Rating', style: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.black),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.share),
                        ],
                      ),
                    ),
                    Text('Compartir Pelicula'),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.bookmarks),
                        ],
                      ),
                    ),
                    Text('Añadir a Lista'),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.queue),
                        ],
                      ),
                    ),
                    Text('Crear Post'),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}
