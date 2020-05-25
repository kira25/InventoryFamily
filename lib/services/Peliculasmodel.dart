import 'package:calculator/services/networking.dart';

class PeliculasModel {
  Future<dynamic> getMovies(String movieName) async {
    NetworkHelper networkHelper =
        NetworkHelper('http://www.omdbapi.com/?t=$movieName&apikey=e8ce68dd');

    var moviesData = await networkHelper.getData();

    return moviesData;
  }
}
