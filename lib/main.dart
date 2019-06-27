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
        title: Text('Alguem me segure!'),
        leading: Icon(Icons.keyboard_arrow_down),
        expandedHeight: 190.0,
        //Propriedades que definem o comportamento da SliverAppBar
        floating: true,
        pinned: true,
        snap: true,
        flexibleSpace: FlexibleSpaceBar(
          background:
              //Um modo de colocar uma imagem por URL no codigo
              Image.network('https://wallpapercave.com/wp/wp1857622.jpg'),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          //Construtor dos filhos da SliverList. Cada filho terá as caracteristicas abaixo
          (BuildContext context, int index) => Card(
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
              ),
          childCount: 9, //numero de filhos do SliverList
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //Propriedades de espaçamento e tamanho dos filhos do grid
          maxCrossAxisExtent: 100.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              //Metodo que atribui diferentes tonalidades de uma cor aos itens do grid
              // conforme eles sao criados
              color: Colors.lightGreen[100 * (index % 9)],
            );
          },
          childCount: 32,
          semanticIndexOffset: 4,
        ),
      )
    ]));
  }
}
