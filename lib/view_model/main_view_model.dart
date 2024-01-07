import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/movie.dart';
import 'package:movie/view/add_movie_page.dart';
import 'package:movie/view_model/add_movie_view_model.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Movie> _movies = [];


  List<Movie> get movies => _movies;

  MainViewModel(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getMovies();
    });
  }

  void _getMovies() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("movies").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
        in snapshot.docs) {
        Movie movie = Movie.fromMap(
        documentSnapshot.id,
        documentSnapshot.data(),
      );
      _movies.add(movie);
    }
    notifyListeners();
  }

  void openAddMoviePage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AddMovieViewModel(),
        child: AddMoviePage(),
      ),
    );
    Navigator.push(context, pageRoute).then((value){
      _movies.clear();
      _getMovies();
    });
  }
}
