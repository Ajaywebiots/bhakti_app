import 'package:bhakti_app/customise/wheelcustom/homepage.dart';
import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  const MyTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(child: HomePage()),
    );
  }
}