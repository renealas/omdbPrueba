import 'package:flutter/material.dart';
import 'package:imdb/widgets/footer.dart';
import 'package:customgauge/customgauge.dart';

class PeliculaDetailScreen extends StatelessWidget {
  final String imdbID;
  final String title;
  final String type;
  final String year;
  final String poster;
  final String plot;
  final String imdbRating;
  final String metaScore;

  PeliculaDetailScreen(this.imdbID, this.title, this.type, this.year,
      this.poster, this.plot, this.imdbRating, this.metaScore);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                child: Text(
                  title,
                  style: TextStyle(backgroundColor: Colors.black54),
                  textAlign: TextAlign.left,
                ),
                alignment: Alignment.bottomLeft,
              ),
              background: Hero(
                tag: imdbID,
                child: Image.network(
                  poster,
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
                                    'Cast & Crew',
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
                      'Tipo: ' + type,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      plot,
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
                        currentValue: double.parse(imdbRating) * 10,
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
                        currentValue: metaScore == 'N/A'
                            ? 0.00
                            : double.parse(
                                metaScore), //double.parse(metaScore == 'N/A' ? 0.00 : metaScore),
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
      ),

      //Esto es para poner el footer en las apps.
      bottomNavigationBar: Footer(),
    );
  }
}
