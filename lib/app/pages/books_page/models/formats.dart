import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';

class Formats extends Equatable with INetworkModel<Formats> {
  String applicationXMobipocketEbook;
  String applicationPdf;
  String textPlainCharsetUsAscii;
  String textPlainCharsetUtf8;
  String applicationRdfXml;
  String applicationZip;
  String applicationEpubZip;
  String textHtmlCharsetUtf8;

  Formats({
    this.applicationXMobipocketEbook,
    this.applicationPdf,
    this.textPlainCharsetUsAscii,
    this.textPlainCharsetUtf8,
    this.applicationRdfXml,
    this.applicationZip,
    this.applicationEpubZip,
    this.textHtmlCharsetUtf8,
  });

  @override
  Formats fromJson(Map<String, dynamic> json) {
    applicationXMobipocketEbook = json['application/x-mobipocket-ebook'];
    applicationPdf = json['application/pdf'];
    textPlainCharsetUsAscii = json['text/plain; charset=us-ascii'];
    textPlainCharsetUtf8 = json['text/plain; charset=utf-8'];
    applicationRdfXml = json['application/rdf+xml'];
    applicationZip = json['application/zip'];
    applicationEpubZip = json['application/epub+zip'];
    textHtmlCharsetUtf8 = json['text/html; charset=utf-8'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['application/x-mobipocket-ebook'] = this.applicationXMobipocketEbook;
    data['application/pdf'] = this.applicationPdf;
    data['text/plain; charset=us-ascii'] = this.textPlainCharsetUsAscii;
    data['text/plain; charset=utf-8'] = this.textPlainCharsetUtf8;
    data['application/rdf+xml'] = this.applicationRdfXml;
    data['application/zip'] = this.applicationZip;
    data['application/epub+zip'] = this.applicationEpubZip;
    data['text/html; charset=utf-8'] = this.textHtmlCharsetUtf8;
    return data;
  }

  @override
  List<Object> get props => [
        this.applicationXMobipocketEbook,
        this.applicationPdf,
        this.textPlainCharsetUsAscii,
        this.textPlainCharsetUtf8,
        this.applicationRdfXml,
        this.applicationZip,
        this.applicationEpubZip,
        this.textHtmlCharsetUtf8,
      ];
}
