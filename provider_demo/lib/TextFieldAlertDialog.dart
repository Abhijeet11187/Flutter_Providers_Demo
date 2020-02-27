import 'package:flutter/material.dart';

class TextFieldAlertDialog extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter User Details'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: "Enter Name"),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "Enter email"),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Cancel'),
                onPressed: () async* {
                  yield {
                    "name": _nameController.value,
                    "email": _emailController.value,
                  };
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField in AlertDialog'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog'),
          color: Colors.red,
          onPressed: () => displayDialog(context),
        ),
      ),
    );
  }
}
