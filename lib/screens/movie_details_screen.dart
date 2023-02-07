import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie/bloc/movie_details_bloc.dart';
import 'package:movie/bloc/movie_list_bloc.dart';
import 'package:movie/model/movie_popular.dart';

import '../widgets/movie_list_item.dart';
import '../widgets/shared_widgets.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case MovieDetailStatus.failure:
            return const Center(child: Text('Error'));
          case MovieDetailStatus.success:
            return Column(
              children: [Image.network("url")],
            );
          case MovieDetailStatus.loading:
            // TODO: Handle this case.
            break;
          case MovieDetailStatus.fav:
            // TODO: Handle this case.
            break;
        }
      },
    );
  }
}
