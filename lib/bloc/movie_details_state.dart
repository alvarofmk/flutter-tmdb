part of 'movie_details_bloc.dart';

enum MovieDetailStatus { initial, success, failure, fav }

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.status = MovieDetailStatus.initial,
      required this.movieId,
      this.isFav = false,
      this.movie});

  final MovieDetailStatus status;
  final MovieDetailResponse? movie;
  final String movieId;
  final bool isFav;

  @override
  List<Object> get props => [];
}
