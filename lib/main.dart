import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
      items: new List<EventCard>.generate(5,
          (int i) => EventCard((i * i).toString(), i.toString() + "th row"))));
}

class MyApp extends StatelessWidget {
  final List<EventCard> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Mixed List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: item.build(context),
            );
          },
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String index1;
  final String str;

  EventCard(this.index1, this.str);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'app/src/main/res/mipmap-hdpi/ic_launcher.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 7),
            child: ListTile(
              leading: Container(
                width: 55,
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'JUL',
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          index1,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    VerticalDivider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              title: Text(
                str,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 3,
                  ),
                  Text(str + "location"),
                  SizedBox(
                    height: 1,
                  ),
                  Text(index1 + "pm"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
