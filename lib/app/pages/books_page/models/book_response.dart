import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';

import 'models.dart';

class BookResponse extends Equatable with INetworkModel<BookResponse> {
  int count;
  String next;
  String previous;
  List<Book> results;

  BookResponse({this.count, this.next, this.previous, this.results});

  @override
  BookResponse fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(Book().fromJson(v));
      });
    }
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [this.count, this.next, this.previous, this.results];
}
