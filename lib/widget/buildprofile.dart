import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class buildProfile extends StatefulWidget {
  buildProfile({Key? key}) : super(key: key);

  @override
  _buildProfileState createState() => _buildProfileState();
}

class _buildProfileState extends State<buildProfile> {
  File? imageFile;
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile!.path);
  }

  _cropImage(filePath) async {
    File? croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      imageFile = croppedImage;
      setState(() {});
    }
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
              child: imageFile == null
                  ? Text(
                      '写真',
                      style: TextStyle(color: Colors.black),
                    )
                  : ClipOval(
                      child: Image.file(
                        File(imageFile!.path),
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
                    await _getFromGallery();

                    print(imageFile!.path);
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
