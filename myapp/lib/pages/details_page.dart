import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/schemas/post.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({@required this.post});

  final Post post;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  _getPostImage() {
    if (widget.post?.featuredMedia == null) {
      return SizedBox(
        height: 10,
      );
    } else {
      return Image.network(widget.post?.featuredMedia?.sourceUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Text(
              widget.post?.title?.rendered.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            _getPostImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.post?.date?.replaceAll('T', ' ')),
                Text(widget.post?.author?.name.toString())
              ],
            ),
            Html(
              data: widget.post?.content?.rendered,
              onLinkTap: (String url) {
                _launchUrl(url);
              },
            )
          ],
        ),
      )),
    );
  }
}

_launchUrl(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Cannot launch $link';
  }
}
