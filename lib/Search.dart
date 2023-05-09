import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Search App")),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Andy Alphard Rahmana",
    "Arya Rachman Praditya",
    "Khairan Nail Fadhillah ",
    "Ibrahim Khalish ",
    "Agung Rafiano",
    "Kiagus Farhan Aziz",
    "Divadan Arya Putrama",
    "Sheyla Aulia",
    "Adri Bagas",
    "Sayyidhina Farhan Abbas",
    "Naillah Nayswa",
    "Sherly Maulana Maulana",
    "Aryo Syawalito Bimo",
    "Fachry Zulfikar",
    "Muhammad Yudiya",
    "Radit Faturrahman",
    "Rasya Fadhil Arviano",
    "Rizky Aditya Nugroho",
    "Jefri Malik",
    "Habibi Rabbani"
  ];

  final recentCities = [
    "Andy Alphard Rahmana",
    "Arya Rachman Praditya",
    "Khairan Nail Fadhillah ",
    "Ibrahim Khalish ",
    "Agung Rafiano",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, "null");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.access_time),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              )
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
