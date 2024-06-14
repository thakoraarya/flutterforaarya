import 'package:flutter/material.dart';

class UserPreview extends StatefulWidget {
  const UserPreview({super.key});

  @override
  State<UserPreview> createState() => _UserPreviewState();
}

class _UserPreviewState extends State<UserPreview> {
  Map Data = {};

  @override
  Widget build(BuildContext context) {
    // final routeSettings = ModalRoute.of(context)?.settings;
    // if (routeSettings != null && routeSettings.arguments is Map) {
    //   Data = routeSettings.arguments as Map;
    // debugPrint(Data.toString());
    // }
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.account_circle_outlined)),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        // leadingWidth: 60,
        // backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        title: Text(
          Data['Name'] ?? 'loading...',
        ),
      ),
      body: Container(
        // height: 500,
        // color: Theme.of(context).colorScheme.surfaceContainer,
        // child: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text(
                Data['Name'] ?? 'loading...',
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email ID"),
              subtitle: Text(
                Data['Email'] ?? 'loading...',
              ),
            ),
            ListTile(
              leading: Icon(Icons.quick_contacts_dialer),
              title: Text("Mobile Number"),
              subtitle: Text(
                Data['Mobile'] ?? 'loading...',
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text("Address"),
              subtitle: Text(
                Data['Address'] ?? 'loading...',
              ),
            ),
          ]),
        ),
        // ),
      ),
    );
  }
}
