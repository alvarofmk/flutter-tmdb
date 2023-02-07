part of 'movie_list_bloc.dart';

enum MovieListstatus { initial, success, failure }

class MovieListState extends Equatable {
  const MovieListState(
      {this.status = MovieListstatus.initial,
      this.movies = const <Results>[],
      this.hasReachedMax = false,
      this.lastPageFetched = 0});

  final MovieListstatus status;
  final List<Results> movies;
  final bool hasReachedMax;
  final int lastPageFetched;

  MovieListState copyWith(
      {MovieListstatus? status,
      List<Results>? movies,
      bool? hasReachedMax,
      int? lastPageFetched}) {
    return MovieListState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        lastPageFetched: lastPageFetched ?? this.lastPageFetched);
  }

  @override
  String toString() {
    return '''MovieListState { status: $status, hasReachedMax: $hasReachedMax, movies: ${movies.length} }''';
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax];
}
