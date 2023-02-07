import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:movie/model/movie_details.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.httpClient) : super(MovieDetailsState(movieId: '')) {
    /*on<MovieDetailsGet>(_movieDetailsGet);
    on<MarkFav>(_markFav);*/
  }

  final http.Client httpClient;
/*
  FutureOr<void> _movieDetailsGet(
      MovieDetailsGet event, Emitter<MovieDetailsState> emit) async {
    try {
      if (state.status == MovieDetailStatus.initial) {
        final movie = await _fetchMovie();
        return emit(state.copyWith(
            status: MovieListstatus.success,
            movies: movies.results,
            hasReachedMax: false,
            lastPageFetched: 1));
      }
      final movies = await _fetchMovies(state.lastPageFetched + 1);
      emit(movies.results!.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: MovieListstatus.success,
              movies: List.of(state.movies)..addAll(movies.results!),
              hasReachedMax: false,
              lastPageFetched: state.lastPageFetched + 1));
    } catch (_) {
      emit(state.copyWith(status: MovieListstatus.failure));
    }
  }

  FutureOr<void> _markFav(MarkFav event, Emitter<MovieDetailsState> emit) {}

  Future<MovieDetailResponse> _fetchMovie(String id) async {
    final response = await httpClient.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/${id}?api_key=200d070fe55142f042035f377a3127b2&language=es"));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return MovieDetailResponse.fromJson(body);
    }
    throw Exception('error fetching movies');
  }*/
}
