import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tarea9/page/map.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TextEditingController> controllers = [
    for (var i = 0; i < 3; i++)
      TextEditingController(
        text: '0.0',
      ),
  ];

  @override
  void dispose() {
    controllers[0].dispose();
    controllers[1].dispose();
    controllers[2].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 82, 189),
        title: Center(
          child: Text(
            "Maps",
            style: TextStyle(fontSize: 30),
          ),
        ),
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Color.fromARGB(255, 20, 82, 189),
      body: Container(
        child: PageView(
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                Container(
                  child: Text(
                    "Ingrese el Nombre",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 10,
                  width: 200,
                  child: TextField(
                    controller: controllers[0],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: Text(
                    "Ingrese la Latitud",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(height: 35),
                Container(
                  height: 10,
                  width: 200,
                  child: TextField(
                    controller: controllers[1],
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: Text(
                    "Ingrese la Longitud",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 10,
                  width: 200,
                  child: TextField(
                    controller: controllers[2],
                  ),
                ),
                SizedBox(height: 60),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) => Map(
                            name: controllers[0].text,
                            position: LatLng(
                              double.parse(controllers[1].text),
                              double.parse(controllers[2].text),
                            ),
                          ),
                          transitionsBuilder: (c, anim, a2, child) =>
                              FadeTransition(opacity: anim, child: child),
                          transitionDuration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: Text(
                      "Buscar",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue[900],
                    border: Border.all(color: Colors.blueAccent.shade700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
