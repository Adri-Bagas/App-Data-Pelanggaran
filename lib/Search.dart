
import 'package:app_data_pelanggaran/models/Url.dart';
import 'package:flutter/material.dart';

import 'SiswaDetailScreen.dart';
import 'models/Siswa.dart';

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
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final String url = '${Urldata.Url}/siswa/show'; // replace with your API url

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
    return FutureBuilder<List<Siswa>>(
      future: fetchDataSiswabyName(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final suggestionList = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(
                top: 15,
              ),
              child: ListTile(
                onTap: () {
                  showResults(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SiswaDetailScreen(siswa: suggestionList[index]),
                    ),
                  );
                },
                leading: Image.network('https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
                title: RichText(
                    text: TextSpan(
                        text: suggestionList[index].nama,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        )),
              ),
            ),
            itemCount: suggestionList.length,
          );
        } else {
          return Center(
            child: Text('No results found'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Siswa>>(
      future: fetchDataSiswabyName(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final suggestionList = snapshot.data!;
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = suggestionList[index].nama;
                showResults(context);
              },
              leading: Icon(Icons.access_time),
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].nama.substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: suggestionList[index].nama.substring(query.length),
                          style: TextStyle(color: Colors.grey),
                        )
                      ])),
            ),
            itemCount: suggestionList.length,
          );
        } else {
          return Center(
            child: Text('No results found'),
          );
        }
      },
    );
  }


}
