//main.dart
import 'package:flutter/material.dart';

import 'theme/theme_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Programatic Theme Creation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MenuOption {
  const MenuOption({this.title, this.icon,this.theme});
  final String title;
  final IconData icon;
  final ThemeTypeEnum theme;
}

const List<MenuOption> choices = const <MenuOption>[
  const MenuOption(title: 'Dark Theme', icon: Icons.sentiment_neutral,theme: ThemeTypeEnum.Dark),
  const MenuOption(title: 'Light Theme', icon: Icons.sentiment_very_satisfied,theme: ThemeTypeEnum.Light),
];

class _MyHomePageState extends State<MyHomePage> {
  MenuOption _selectedMenu=choices[0];
  void _select(MenuOption choice) {
    setState(() {
      _selectedMenu = choice;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Theme(
      data: themeProvider(context,_selectedMenu.theme),
      child: Scaffold(

        appBar: AppBar(

          title: Text(widget.title),
          actions: <Widget>[

            PopupMenuButton(
              elevation: 3.2,
              onCanceled: ()=>{},
              onSelected: _select,
              itemBuilder: (BuildContext context)
            {

              return choices.map((MenuOption choice) {
                return PopupMenuItem<MenuOption>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },

            ),
          ],
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Selected Theme ',style: TextStyle(fontSize: 24),
              ),
              RaisedButton(
                child: Text(" ${_selectedMenu.title}"),
                onPressed: (){

                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

}
