import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';

class Authors extends Equatable with INetworkModel<Authors> {
  int birthYear;
  int deathYear;
  String name;

  Authors({this.birthYear, this.deathYear, this.name});

  @override
  Authors fromJson(Map<String, dynamic> json) {
    birthYear = json['birth_year'];
    deathYear = json['death_year'];
    name = json['name'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birth_year'] = this.birthYear;
    data['death_year'] = this.deathYear;
    data['name'] = this.name;
    return data;
  }

  @override
  List<Object> get props => [this.birthYear, this.deathYear, this.name];
}
