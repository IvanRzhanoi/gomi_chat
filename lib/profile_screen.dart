import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //const ProfileScreen({Key? key}) : super(key: key);

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  var username = "not found";

  @override
  initState() {
    super.initState();
    loadUsername();
  }

  loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String usernameStorage = prefs.getString('username') ?? "anonym";
    setState(() {
      username = usernameStorage;
      myController.text = username;
    });
    print(username);
  }

  setUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = myController.text;
    await prefs.setString('username', username);
    print(username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My profile'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'My username is:',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Text(username),
          TextField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'My username',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                setUsername();
              });
            },
            //(myController.text.isEmpty || myController.text == username) ? null : setUsername(),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}