import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> notes() async {
  final response = await http.get(
    Uri.https('24-horas.mx', 'wp/v2/posts/?_embed'),
    headers: {'Accept': 'application/json'},
  );
  //Uri.https('24-horas.mx', 'wp/v2/posts/?_embed&categories=7&status=publish'),

  var toJSON = jsonDecode(response.body);
  return toJSON;
}
