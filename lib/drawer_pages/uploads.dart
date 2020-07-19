import 'package:flutter/material.dart';


class Uploads extends StatefulWidget {
  @override
  _UploadsState createState() => _UploadsState();
}

class _UploadsState extends State<Uploads> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> formData;
  List<String> field = [ 'Dance' , 'Singing' , 'Sports' , 'Others', ];



  _UploadsState() {
    formData = {
      'Field': '',

    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buildFutures(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            default:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                if (snapshot.data != null)
                  return Scaffold(
                    appBar: AppBar(
                      titleSpacing: 10.0,
                      title: Text('New Post'),
                      centerTitle: true,
                      actions: <Widget>[
                        Builder(
                          builder: (BuildContext context) {
                            return IconButton(
                                icon: const Icon(Icons.check),
                                iconSize: 30.0,
                                tooltip: 'Save',
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {         //  from here is the tick button function u need to sync with ur databse to upload
                                    _formKey.currentState.save();
                                    _formKey.currentState.save(); // til here
                                    showDialog<String>(
                                        context: context,
                                        builder:
                                            (BuildContext dialogContext) =>
                                            AlertDialog(
                                              content: Text(
                                                  'uploading.....'),//here connect to database
                                            ));
                                  }
                                });
                          },
                        )
                      ],
                    ),
                    body: Container(
                      color: Colors.white,
                      constraints: BoxConstraints.expand(),
                      child: Form(
                        key: _formKey,
                        autovalidate: false,
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Divider(
                                  height: 20.0,
                                  color: Colors.white
                              ),
                              TextField(
                                maxLength: 40,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Write a caption...',
                                  hintText: 'write here..',

                                ),
                                autofocus: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                else
                  return LinearProgressIndicator();
              }
          }
        });
  }

  Future<bool> buildFutures() async {
    return true;
  }
}


