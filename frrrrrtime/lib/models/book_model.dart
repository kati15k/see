import 'package:flutter/material.dart';

class BookModel {
  String? book_title;
  int? book_release_date;
  String? book_poster_url;
  double? rating;

  BookModel(this.book_title, this.book_release_date, this.book_poster_url,
      this.rating);
}