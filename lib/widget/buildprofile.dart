import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class buildProfile extends StatefulWidget {
  buildProfile({Key? key}) : super(key: key);

  @override
  _buildProfileState createState() => _buildProfileState();
}

class _buildProfileState extends State<buildProfile> {
  XFile? file;
  ImagePicker? _picker = ImagePicker();
  List<XFile>? files;

  pic() async {
    final XFile? photo = await _picker!.pickImage(source: ImageSource.gallery);
    
    setState(() {
      file = photo;
    });
    print("image picked");
    
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: file == null
                  ? Text('写真',style: TextStyle(color: Colors.black),)
                  : ClipOval(
                      child: Image.file(
                        File(file!.path),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                  onPressed: () async {
                    await pic();
                    print(file!.path);
                  },
                  child: Text(
                    '画像を選択',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ),
        
        ],
      ),
    );
  }
}
