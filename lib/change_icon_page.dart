import 'package:flutter/material.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';

class ChangeIconPage extends StatelessWidget {
  const ChangeIconPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Launcher Icon'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            IconSelector(
              appIcon: "Blue",
              imageAsset: 'assets/icon-blue.png',
              name: 'Blue',
            ),
            IconSelector(
              appIcon: "Red",
              imageAsset: 'assets/icon-red.png',
              name: 'Red',
            ),
          ],
        ),
      ),
    );
  }
}

class IconSelector extends StatelessWidget {
  final String appIcon;
  final String imageAsset;
  final String name;

  IconSelector(
      {required this.appIcon, required this.imageAsset, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imageAsset),
              Text(name),
            ],
          ),
        ),
        onTap: () async {
          try {
            if (await FlutterDynamicIcon.supportsAlternateIcons) {
              await FlutterDynamicIcon.setAlternateIconName(appIcon);
              print("App icon change successful");
              return;
            } else {
              print("Icon change not supported");
            }
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}
