import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie/model/movie.dart';

class AddMovieViewModel with ChangeNotifier{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addMovie(BuildContext context, String name, String type,String director) async {
    Movie movie = Movie(name, type, director);
    await _firestore.collection("movies").doc().set(movie.toMap());
    Navigator.pop(context);
  }

}