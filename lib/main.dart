import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: "/",    // overrides the base route
        routes: {
          "/": (context) => const Loading(),
          // "/" is the base/default route, these routes takes a function argument "context" item
          // that takes us to where in the widget tree it is
          "/home": (context) => const Home(),
          "/location": (context) => const ChooseLocation(),
        },
      ),
    );
