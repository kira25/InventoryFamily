import 'package:calculator/services/Peliculasmodel.dart';
import 'package:flutter/material.dart';

class Peliculas extends StatefulWidget {
  @override
  _PeliculasState createState() => _PeliculasState();
}

class _PeliculasState extends State<Peliculas> {
  PeliculasModel pelicula = PeliculasModel();
  String inputmovieName;
  String movieName;
  int year;
  String plot;
  String poster;

  @override
  void initState() {
    super.initState();

    initialData();
  }

  void initialData() async {
    var movieData = await pelicula.getMovies('avengers');

    setState(() {
      movieName = movieData['Title'];
      year = int.parse(movieData['Year']);
      plot = movieData['Plot'];
      poster = movieData['Poster'];
    });
  }

  void updateUIMovies(dynamic movieData) {
    setState(() {
      if (movieData == null) {
        movieName = '';
        year = 0;
        plot = '';
        poster = '';
        return;
      }
      movieName = movieData['Title'];
      year = int.parse(movieData['Year']);
      plot = movieData['Plot'];
      poster = movieData['Poster'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF031A8C), Color(0xFF418CFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: SafeArea(
                child: SingleChildScrollView(
                                  child: Column(
              children: <Widget>[
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 50.0,
                              color: Colors.white,
                            )),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.only(right: 60.0),
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Lista de peliculas',
                          style: TextStyle(
                              color: Colors.white,
                              height: 3,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            onChanged: (value) {
                              inputmovieName = value;
                            },
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter movie name',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                          color: Colors.white,
                          onPressed: () async {
                            if (inputmovieName != null) {
                              var movieData =
                                  await pelicula.getMovies(inputmovieName);
                              print(movieData['Title']);
                              print(movieData['Year']);
                              updateUIMovies(movieData);
                            }
                          },
                          child: Icon(
                            Icons.search,
                            size: 20.0,
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          '$movieName',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          '$year',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          '$plot',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: Image.network(
                            '$poster',
                            height: 300,
                            width: double.infinity,
                          )),
                    ],
                  )
              ],
            ),
                )),
          ),
        ),
      ),
    );
  }
}
