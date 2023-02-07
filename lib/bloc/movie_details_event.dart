part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class MovieDetailsGet extends MovieDetailsEvent {}

class MarkFav extends MovieDetailsEvent {}
