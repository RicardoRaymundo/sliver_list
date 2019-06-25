import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            //AppBar Sliver
            title: Text('Alguem me segure!'),
            leading: Icon(Icons.keyboard_arrow_down),
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  //Um modo de colocar uma imagem por URL no codigo
                  Image.network('https://wallpapercave.com/wp/wp1857622.jpg'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => Card(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            //Outro método para colocar imagem por URL
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_4IhCaoqoBHp5Da8geUJv67yxLbVhe8wzuVbXG-f7iHkfo9f'),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text('CONTEUDO DO CARD!!')
                      ],
                    ),
                  ),
                )),
          )
        ]));
  }
}
