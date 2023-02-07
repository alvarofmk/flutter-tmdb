import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie/bloc/movie_list_bloc.dart';
import 'package:movie/model/movie_popular.dart';
import 'package:movie/screens/movie_list_screen.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Card(
        elevation: 15,
        color: Color.fromARGB(255, 24, 24, 24),
        child: Column(children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/original/${movie.backdropPath}")),
                ),
                height: 350.0,
              ),
              Positioned.fill(
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Color.fromARGB(0, 24, 24, 24),
                            Color.fromARGB(255, 24, 24, 24),
                          ],
                          stops: [
                            0.0,
                            1.0
                          ])),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 7, bottom: 5),
            child: Text(
              "${movie.title}",
              style: TextStyle(
                  color: Color.fromARGB(122, 75, 75, 75),
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              "${movie.overview}",
              style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
            ),
          )
        ]),
      ),
    );
  }
}
