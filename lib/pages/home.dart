import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String backgroundImage = data["isDaytime"] ? "day.png" : "night.png";
    Color backgroundColor = data["isDaytime"] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/$backgroundImage"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/location");
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      "Edit Location",
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    )),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data["location"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  data["time"],
                  style: const TextStyle(fontSize: 66, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
