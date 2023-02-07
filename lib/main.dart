import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie/bloc/movie_details_bloc.dart';
import 'package:movie/bloc/movie_list_bloc.dart';
import 'package:movie/model/movie_popular.dart';
import 'package:movie/screens/movie_list_screen.dart';

void main() {
  runApp(const App());
}

class App extends MaterialApp {
  const App({super.key}) : super(home: const MovieListPage());
}

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('YourMovie'),
            backgroundColor: Color.fromARGB(255, 24, 24, 24)),
        body: Container(
          color: Color.fromARGB(255, 24, 24, 24),
          child: BlocProvider(
            create: (_) => MovieListBloc(http.Client())..add(MoviesFetched()),
            child: const MovieList(),
          ),
        ));
  }
}

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('${movie.title}'),
            backgroundColor: Color.fromARGB(255, 24, 24, 24)),
        body: Container(
          color: Color.fromARGB(255, 24, 24, 24),
          child: BlocProvider(
            create: (_) =>
                MovieDetailsBloc(http.Client())..add(MovieDetailsGet()),
            child: const MovieDetail(),
          ),
        ));
  }
}
