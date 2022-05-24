import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Tab2page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: new MaterialButton(
                color: Colors.redAccent,
                onPressed: _launchURL2,
                child: new Text(' Mejores bases de datos?'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: new MaterialButton(
                color: Colors.redAccent,
                onPressed: _launchURL,
                child: new Text(' Tutorial,base de datos'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: new MaterialButton(
                color: Colors.redAccent,
                onPressed: _launchURL3,
                child: new Text(' Ventajas y Desventajas'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: new MaterialButton(
                color: Colors.redAccent,
                onPressed: _launchURL4,
                child: new Text(' BDR VS BDNR'),
              ),
            ),
          ],
        ));
  }
}

_launchURL() async {
  const url =
      'https://www.lucidchart.com/pages/es/tutorial-de-estructura-y-diseno-de-bases-de-datos';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL2() async {
  const url = 'https://pandorafms.com/blog/es/mejores-bases-de-datos/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL3() async {
  const url = 'https://tecnomagazine.net/ventajas-y-desventajas-base-de-datos/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL4() async {
  const url =
      'https://www.pragma.com.co/academia/lecciones/bases-de-datos-relacionales-vs.-no-relacionales#:~:text=Las%20bases%20de%20datos%20relacionales%20se%20basan%20en%20la%20organizaci%C3%B3n,o%20m%C3%A1s%20conjuntos%20de%20datos.';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
