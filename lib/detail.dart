import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail(this.id, this.title) : super();
  final String id;
  final String title;

  @override
  _MovieDetailState createState() {
    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Text('电影：${widget.title}'),
    );
  }
}
