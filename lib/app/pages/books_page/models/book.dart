import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';

import 'models.dart';

class Book extends Equatable with INetworkModel<Book> {
  int id;
  List<Authors> authors;
  List<String> bookshelves;
  int downloadCount;
  Formats formats;
  List<String> languages;
  String mediaType;
  List<String> subjects;
  String title;

  Book({
    this.id,
    this.authors,
    this.bookshelves,
    this.downloadCount,
    this.formats,
    this.languages,
    this.mediaType,
    this.subjects,
    this.title,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.authors != null) {
      data['authors'] = this.authors.map((v) => v.toJson()).toList();
    }
    data['bookshelves'] = this.bookshelves;
    data['download_count'] = this.downloadCount;
    if (this.formats != null) {
      data['formats'] = this.formats.toJson();
    }
    data['languages'] = this.languages;
    data['media_type'] = this.mediaType;
    data['subjects'] = this.subjects;
    data['title'] = this.title;
    return data;
  }

  @override
  Book fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['authors'] != null) {
      authors = [];
      json['authors'].forEach((v) {
        authors.add(new Authors().fromJson(v));
      });
    }
    bookshelves = json['bookshelves'].cast<String>();
    downloadCount = json['download_count'];
    formats = json['formats'] != null ? new Formats().fromJson(json['formats']) : null;
    languages = json['languages'].cast<String>();
    mediaType = json['media_type'];
    subjects = json['subjects'].cast<String>();
    title = json['title'];

    return this;
  }

  @override
  List<Object> get props => [
        this.id,
        this.authors,
        this.bookshelves,
        this.downloadCount,
        this.formats,
        this.languages,
        this.mediaType,
        this.subjects,
        this.title,
      ];
}
