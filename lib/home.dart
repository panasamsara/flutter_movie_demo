import 'package:flutter/material.dart';
import './list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: const Text('电影列表'),
              centerTitle: true,
              actions: <Widget>[
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ]),
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: const <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('张三'),
                  accountEmail: Text('abc@163.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://hbimg.huaban.com/687c4dfe78cb85d9a50177c41f75187a71d2e81071807a-ppCfao_fw658'),
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://lmg.jj20.com/up/allimg/1113/0F420110430/200F4110430-6-1200.jpg'),
                          fit: BoxFit.cover)),
                ),
                ListTile(
                  title: Text("用户反馈"),
                  trailing: Icon(Icons.feedback),
                ),
                ListTile(
                  title: Text("系统设置"),
                  trailing: Icon(Icons.settings),
                ),
                ListTile(
                  title: Text("我要发布"),
                  trailing: Icon(Icons.send),
                ),
                ListTile(
                  title: Text("注销"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.black),
            height: 50,
            child: const TabBar(
              labelStyle: TextStyle(height: 0, fontSize: 10),
              tabs: <Widget>[
                Tab(
                  text: '正在热映',
                  icon: Icon(Icons.movie_filter),
                ),
                Tab(
                  text: '即将上映',
                  icon: Icon(Icons.movie_creation),
                ),
                Tab(
                  text: 'top250',
                  icon: Icon(Icons.local_movies),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              MovieList('in_theaters'),
              MovieList('coming_soon'),
              MovieList('top250'),
            ],
          ),
        ));
  }
}
