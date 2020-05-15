import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mycomiclist_template/comic.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Comic> comicList;

  void initState() {
    super.initState();
    comicList = [
      new Comic(
        title: 'The Flash #32',
        imageURL:
            'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/7292030-752.jpg',
      ),
      new Comic(
        title: 'Batman #42',
        imageURL: 'https://via.placeholder.com/200x300',
      ),
      new Comic(
        title: 'Daredevil and The Defenders #1',
        imageURL: 'https://via.placeholder.com/100',
      ),
      new Comic(
        title: 'Deadpool #21',
        imageURL: 'https://via.placeholder.com/200x300',
      ),
      new Comic(
        title: 'Naruto #103',
        imageURL: 'https://via.placeholder.com/200x300',
      ),
    ];
  }

  Widget _buildGridTile(Comic comic) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  comic.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: AspectRatio(
              aspectRatio: 5,
              child: Text(comic.title),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.lightBlue[900],
      ),
      body: GridView.builder(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.55,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: comicList.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return _buildGridTile(comicList[index]);
        },
      ),
    );
  }
}
