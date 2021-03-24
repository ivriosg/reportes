import 'package:flutter/material.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({Key key}) : super(key: key);

  static const routeName = 'single';

  @override
  Widget build(BuildContext context) {
    Map post = ModalRoute.of(context).settings.arguments as Map;
    //Ajustamos tamaño
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(post['title']['rendered']),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.network(
              post['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']
                  ['medium_large']['source_url'],
              height: _screenSize.height * 0.32,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              post['title']['rendered'],
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'RajdhaniSemiBold',
                color: Colors.pink,
              ),
            ),
          ),
          Text(post['m_categories'][0]['name']),
        ],
      ),
    );
  }
}


/*

ListView(
        children: [
          Image.network(
            post['_embedded']['wp:featuredmedia'][0]['media_details']['sizes']
                ['medium_large']['source_url'],
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              post['title']['rendered'],
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'RajdhaniSemiBold',
                  letterSpacing: .5),
            ),
          ),
          HtmlWidget(
            post['content']['rendered'],
          )
        ],
      ),*/