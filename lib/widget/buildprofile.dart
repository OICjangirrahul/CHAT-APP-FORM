import 'package:flutter/material.dart';

class buildProfile extends StatefulWidget {
  buildProfile({Key? key}) : super(key: key);

  @override
  _buildProfileState createState() => _buildProfileState();
}

class _buildProfileState extends State<buildProfile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text('プロファール画像「必須」'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.filmibeat.com/wimg/desktop/2018/11/shahrukh-khan_154114143790.jpg'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: size.width * 0.35,
                height: size.height * 0.04,
                decoration: BoxDecoration(border: Border.all()),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () {},
                    child: Text(
                      '画像を選択',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            )
          ],
        ),
      ],
    );
  }
}
