import 'package:movie_line/src/class/verse.dart';

class Hymn {
  final int id;
  final String name;
  final int number;
  final String? author;
  final int? year;
  bool favorite = false;
  final List<Verse> verses;
  final String biblicalQuote;

  Hymn({
    required this.id,
    required this.name,
    required this.number,
    this.author,
    this.year,
    required this.favorite,
    required this.verses,
    required this.biblicalQuote,
  });
}
