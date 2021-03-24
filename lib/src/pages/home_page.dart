import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:veinticuatrohoras/src/api/wordpress.dart';
import 'package:veinticuatrohoras/src/pages/single_page.dart';

class HomePage extends StatelessWidget {
  final sectionStyle = TextStyle(
      fontFamily: 'RajdhaniSemiBold', fontSize: 25.0, letterSpacing: 5.0);

  final titleStyle = TextStyle(fontFamily: 'RajdhaniSemiBold', fontSize: 20.0);

  final metaStyle = TextStyle(fontFamily: 'OpenSansRegular', fontSize: 14.0);

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: upperNav(),
      body: FutureBuilder(
        future: notes(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          final _screenSize = MediaQuery.of(context).size;
          if (snapshot.hasData) {
            var posts = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                Map post = snapshot.data[index];
                return GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(SinglePage.routeName, arguments: post),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    width: _screenSize.width * 0.65,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: getImage(post),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              getTitle(post),
                              SizedBox(height: 10.0),
                              getMeta(post),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: getBar(),
    );
  }

  upperNav() {
    return AppBar(
      backgroundColor: Color(0xFFCC0000),
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/images/logotipo.png',
            fit: BoxFit.cover,
            height: 55,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }

  getImage(post) {
    return Image.network(
      post['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']
          ['medium_large']['source_url'],
      fit: BoxFit.cover,
    );
  }

  getTitle(post) {
    return Text(post['title']['rendered'].toString(), style: titleStyle);
  }

  getMeta(post) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getUsername(post),
        getDate(post),
      ],
    );
  }

  getUsername(post) {
    return Text(post['_embedded']['author'][0]['name'], style: metaStyle);
  }

  getDate(post) {
    final dateFormate =
        DateFormat.yMMMMd('en_US').format(DateTime.parse(post['date_gmt']));

    return Text(dateFormate, style: metaStyle);
  }

  getBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFCC0000),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _bottomItem(Icons.home, 'Home'),
        _bottomItem(Icons.ondemand_video, 'Videos'),
        _bottomItem(Icons.apps, 'Categorias'),
        _bottomItem(Icons.list_alt, 'Impreso'),
        _bottomItem(Icons.video_collection_sharp, 'Opinión'),
      ],
    );
  }

  _bottomItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: title,
    );
  }
}
