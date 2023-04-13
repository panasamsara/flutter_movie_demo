import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';

var dio = Dio();

class MovieList extends StatefulWidget {
  const MovieList(this.mt) : super();
  final String mt;

  @override
  State<StatefulWidget> createState() {
    return _MovieListState();
  }
}

class _MovieListState extends State<MovieList> {
  int page = 1;
  int pagesize = 10;
  var mList = [];
  var total = 0;

  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mList.length,
      itemBuilder: (BuildContext ctx, int i) {
        var mitem = mList[i];
        return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext ctx) {
                return MovieDetail(mitem['id'], mitem['title']);
              }));
            },
            child: Row(
              children: <Widget>[
                Image.network(
                  mitem['images']['small'],
                  width: 139,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('电影名称: ${mitem['title']}'),
                      Text('上映年份: ${mitem['year']}年'),
                      Text('电影类型: ${mitem['genres'].join(',')}'),
                      Text('豆瓣评分: ${mitem['rating']['average']}'),
                      Text('主要演员: ${mitem['title']}'),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  void getMovieList() async {
    int offset = (page - 1) * pagesize;
    String url =
        'http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pagesize';
    try {
      Response response = await dio.get(url);
      print(response.data);
      var result = response.data;
      setState(() {
        mList = result['subjects'];
        total = result['total'];
      });
    } catch (e) {
      print(e);
    }
  }
}
