import 'package:flutter/material.dart';
import 'package:widgets_guide/models/user.dart';
import 'package:widgets_guide/services/json_services.dart';

class ListViewFilterable extends StatefulWidget {
  ListViewFilterable({Key key}) : super(key: key);

  @override
  _ListViewFilterableState createState() => _ListViewFilterableState();
}

class _ListViewFilterableState extends State<ListViewFilterable> {
  List<User> users = List();
  List<User> filteredUsers = List();

  @override
  void initState() {
    super.initState();
    JsonServices.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = usersFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Filterable'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Enter a name or email',
            ),
            onChanged: (string) {
              setState(() {
                filteredUsers = users
                    .where((user) =>
                        user.name
                            .toLowerCase()
                            .contains(string.toLowerCase()) ||
                        user.email.toLowerCase().contains(string.toLowerCase()))
                    .toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filteredUsers[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          filteredUsers[index].email,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
