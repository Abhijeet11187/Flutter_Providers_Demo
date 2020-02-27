import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/TextFieldAlertDialog.dart';
import 'package:provider_demo/addUser.dart';
import 'package:provider_demo/userModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Providers Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => addUser(),
        child: MyHomePage(title: 'Proviers in Flutter'),
      ),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<addUser>(builder: (context, user, child) {
        return ListView.builder(
            itemCount: user.userList.length,
            itemBuilder: (context, index) {
              return Container(
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset('images/tickmark2.png')),
                  title: Text(user.userList[index].name),
                  subtitle: Text(user.userList[index].email),
                ),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add),
          // onPressed:()async{
          //  var result= await TextFieldAlertDialog().displayDialog(context);
          //  print("Result is $result");
          // }
          // ,
          onPressed: () => {
                Provider.of<addUser>(context, listen: false).addUserInList(),
              }),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
