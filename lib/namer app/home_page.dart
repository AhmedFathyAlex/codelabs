import 'package:flutter/material.dart';

import 'favourites.dart';
import 'generator.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  var bodies = [GeneratorPage(),FavouritesPage()];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: index,
                  onDestinationSelected: (value) {
                  setState(() {
                    index = value;

                  });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: bodies[index],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}