import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void getData() async {
    // simulate network request for a username
    String username = await Future.delayed(const Duration(seconds: 3), () {
      return "Mark";
    });
    // simulate network request for bio
    String bio = await Future.delayed(const Duration(seconds: 0), () {
      return "chef, gamer";
    });

    print("$username - $bio");
  }
    @override
  void initState() {
      super.initState();
        getData();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Choose a Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ElevatedButton(onPressed: () {
          setState(() {
            counter++;
          });
        }, child: Text(" counter is $counter"),

        ),
      );
    }
  }
