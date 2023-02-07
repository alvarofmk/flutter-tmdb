import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';

import '../model/movie_popular.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:http/http.dart' as http;

part 'movie_list_event.dart';
part 'movie_list_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc(this.httpClient) : super(MovieListState()) {
    on<MovieListEvent>(
      __onMoviesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  FutureOr<void> __onMoviesFetched(
      MovieListEvent event, Emitter<MovieListState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == MovieListstatus.initial) {
        final movies = await _fetchMovies();
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

  Future<MoviePopularResponse> _fetchMovies([int page = 1]) async {
    final response = await httpClient.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/popular?api_key=200d070fe55142f042035f377a3127b2&language=en-US&page=$page"));
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return MoviePopularResponse.fromJson(body);
    }
    throw Exception('error fetching movies');
  }
}
