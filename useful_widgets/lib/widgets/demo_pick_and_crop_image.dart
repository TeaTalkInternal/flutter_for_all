/*
    Add this code to AndroidManifest. If you forget to add then app will crash.
<activity
           android:name="com.yalantis.ucrop.UCropActivity"
           android:screenOrientation="portrait"
           android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class CommonAddPhotoWidget extends StatelessWidget {
  CommonAddPhotoWidget({Key? key, this.helperImage}) : super(key: key);
  final BehaviorSubject<File> streamImage = BehaviorSubject();
  final dynamic helperImage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<File>(
          stream: streamImage,
          builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
            if (snapshot.hasData) {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      radius: 50,
                      foregroundImage: Image.file(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ).image),
                  InkWell(
                    onTap: () {
                      getImage();
                    },
                    child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18,
                        )),
                  ),
                ],
              );
            }
            return InkWell(
              onTap: () {
                getImage();
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[50]),
                width: 90,
                height: 90,
                child: Icon(
                  Icons.add_a_photo,
                  size: 30,
                  color: Colors.grey[300],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final croppedImage = await ImageCropper().cropImage(
        sourcePath: image!.path,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100);
    streamImage.add(File(croppedImage!.path));
  }
}
