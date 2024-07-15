import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

Drawer myDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profile2.jpg"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Muhammad Irfan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(FontAwesome5.linkedin_in),
                title: const Text('LinkedIn'),
                onTap: () {
                  launch(
                      "https://www.linkedin.com/in/muhammad-irfan-938813301/");
                },
              ),
              ListTile(
                leading: const Icon(FontAwesome5.github),
                title: const Text('GitHub'),
                onTap: () {
                  launch("https://github.com/DXR3IN");
                },
              ),
              ListTile(
                leading: const Icon(FontAwesome5.whatsapp),
                title: const Text('WhatsApp'),
                onTap: () {
                  launch("https://wa.me/6289625313937");
                },
              ),
            ],
          ),
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.email, color: Colors.grey[400]),
          title: Text(
            'mhdirfan0856@gmail.com',
            style: TextStyle(color: Colors.grey[400]),
          ),
        ),
      ],
    ),
  );
}
