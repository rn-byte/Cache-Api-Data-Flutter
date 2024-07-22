import 'package:equatable/equatable.dart';

abstract class NewsEvents extends Equatable {
  const NewsEvents();

  @override
  List<Object?> get props => [];
}

class FetchHackerNews extends NewsEvents {}
