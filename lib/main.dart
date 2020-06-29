import 'package:flutter/material.dart';
import 'package:mobile_sidebar/mobile_sidebar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sidebar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Sidebar Demo'),
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

  int index = 0;
  bool searching = false;
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MobileSidebar(
        currentIndex: index,
        onTabChanged: (val) {
          if (mounted)
            setState(() {
              index = val;
            });
        },
        isSearching: searching,
        isSearchChanged: (val) {
          if (mounted)
            setState(() {
              searching = val;
            });
        },
        titleBuilder: (context) {
          return FancyTitle(
            title: Text('Side Bar Demo',style: TextStyle(fontSize: 24),),
          );
        },
        accountBuilder: (context) {
          if (_loggedIn) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (mounted)
                    setState(() {
                      _loggedIn = false;
                    });
                },
                child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            );
          }
          return FlatButton(
            child: Text("Sign In"),
            onPressed: () {
              if (mounted)
                setState(() {
                  _loggedIn = true;
                });
            },
          );
        },
        showSearchButton: true,
        tabs: <TabChild>[
          TabChild(
            title: 'Light Blue',
            builder: (context) => NewScreen(
              color: Colors.lightBlue,
              name: 'Light Blue Screen',
            ),
          ),
          TabChild(
            title: 'Light Green',
            builder: (context) => NewScreen(
              color: Colors.lightGreen,
              name: 'Light Green Screen',
            ),
          ),
          TabChild(
            title: 'Red',
            builder: (context) => NewScreen(
              color: Colors.red,
              name: 'Red Screen',
            ),
          ),
          TabChild(
            title: 'Light Green 3',
            builder: (context) => NewScreen(
              color: Colors.lightGreen,
              name: 'Light Green Screen',
            ),
          ),
          TabChild(
            title: 'Red 3',
            builder: (context) => NewScreen(
              color: Colors.red,
              name: 'Red Screen',
            ),
          ),
          TabChild(
            title: 'Light Green 4',
            builder: (context) => NewScreen(
              color: Colors.lightGreen,
              name: 'Light Green Screen',
            ),
          ),
          TabChild(
            title: 'Red 4',
            builder: (context) => NewScreen(
              color: Colors.red,
              name: 'Red Screen',
            ),
          ),
        ],
      ),
    );
  }
}

class FancyTitle extends StatelessWidget {
  const FancyTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: <Widget>[
        Container(width: 4.0),
        title,
      ],
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({
    Key key,
    @required this.color,
    @required this.name,
  }) : super(key: key);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: RaisedButton.icon(
          icon: Icon(Icons.arrow_right),
          label: Text("Push to Screen"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(),
                body: NewScreen(color: color, name: name),
              ),
            ));
          },
        ),
      ),
    );
  }
}