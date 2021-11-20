import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gutenberg/app/pages/books_page/models/models.dart';
import 'package:gutenberg/app/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class BookTile extends StatelessWidget {
  final Book _bookDetails;

  const BookTile(this._bookDetails);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // handle book click and open supported files in browser
        if (_bookDetails.formats.textHtmlCharsetUtf8 != null) {
          launch(_bookDetails.formats.textHtmlCharsetUtf8);
        } else if (_bookDetails.formats.applicationPdf != null) {
          launch(_bookDetails.formats.applicationPdf);
        } else if (_bookDetails.formats.textPlainCharsetUtf8 != null) {
          launch(_bookDetails.formats.textPlainCharsetUtf8);
        } else if (_bookDetails.formats.textPlainCharsetUsAscii != null) {
          launch(_bookDetails.formats.textPlainCharsetUsAscii);
        } else if (_bookDetails.formats.applicationRdfXml != null) {
          launch(_bookDetails.formats.applicationRdfXml);
        } else if (_bookDetails.formats.applicationEpubZip != null) {
          launch(_bookDetails.formats.applicationEpubZip);
        } else if (_bookDetails.formats.applicationXMobipocketEbook != null) {
          launch(_bookDetails.formats.applicationXMobipocketEbook);
        } else if (_bookDetails.formats.applicationZip != null) {
          launch(_bookDetails.formats.applicationZip);
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: 'https://www.gutenberg.org/cache/epub/${_bookDetails.id}/pg${_bookDetails.id}.cover.medium.jpg',
                  placeholder: (context, url) => Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.lightGray2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _bookDetails.title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              softWrap: false,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _bookDetails.authors.length > 0 ? _bookDetails.authors[0].name : '-',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.subtitle2,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
