import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final sectionStyle = TextStyle(
      fontFamily: 'RajdhaniSemiBold', fontSize: 25.0, letterSpacing: 2.0);

  final titleStyle = TextStyle(fontFamily: 'RajdhaniSemiBold', fontSize: 20.0);

  final metaStyle = TextStyle(fontFamily: 'OpenSansRegular', fontSize: 14.0);
  final catStyle = TextStyle(
      fontFamily: 'RajdhaniMedium', fontSize: 15.0, color: Color(0xFFCC0000));
  final postStyle =
      TextStyle(fontFamily: 'FjallaOne', fontSize: 16.0, letterSpacing: 0.5);

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: upperNav(),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PRINCIPALES', style: sectionStyle),
            Container(
              height: _screenSize.height * 0.38,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  mainNotes(),
                  mainNotes(),
                  mainNotes(),
                  mainNotes(),
                  mainNotes(),
                ],
              ),
            ),
            Text('MINUTO A MINUTO', style: sectionStyle),
            Expanded(
              //height: _screenSize.height * 0.38,
              child: ListView(
                children: [
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                  latestNotes(context),
                ],
              ),
            ),
          ],
        ),
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

  mainNotes() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Card(
        color: Color(0xFFF1F1F1),
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        child: Container(
          width: 275,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                placeholder: AssetImage('assets/images/loader.gif'),
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://gq8ne3sd6ka12wvdz3ubnadf-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/clara-luz.jpg.webp'),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      'Maria Luz Flores manda mensaje de apoyo a mujeres.',
                      style: titleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Redacción 24 Horas', style: metaStyle),
                        Text('Marzo 8, 2021', style: metaStyle),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  latestNotes(context) {
    final _screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: _screenSize.width * 0.4,
          padding: EdgeInsets.only(right: 10.0, bottom: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loader.gif'),
              fit: BoxFit.contain,
              image: NetworkImage(
                  'https://gq8ne3sd6ka12wvdz3ubnadf-wpengine.netdna-ssl.com/wp-content/uploads/2021/03/clara-luz.jpg.webp'),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AMLO', style: catStyle),
              Text(
                'Salimos bien, dice AMLO tras protestas del 8M.',
                style: postStyle,
              ),
              SizedBox(height: 5.0),
              Text('11:40 AM', style: metaStyle),
            ],
          ),
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
