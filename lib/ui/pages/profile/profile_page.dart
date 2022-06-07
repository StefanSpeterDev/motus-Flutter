import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, "NOM", 'STEFAN SPETER'),
        _buildButtonColumn(color, "AGE", '23 ANS'),
        _buildButtonColumn(color, "PARTIES", '34'),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon profil'),
      ),
      body: ListView(
        children: [
          const CircleAvatar(
            //backgroundImage: AssetImage('images/StefanSpeter.jpeg'),
            child: ClipOval(child: Image(image: AssetImage('images/StefanSpeter.jpeg'),fit: BoxFit.fitWidth,)),
            radius: 35.0,
          ),
          buttonSection,
        ],
      ),
    );
  }
  Column _buildButtonColumn(Color color, String text, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}