import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';

class ImageSET extends StatefulWidget {
  const ImageSET({Key? key}) : super(key: key);

  @override
  State<ImageSET> createState() => _ImageSETState();
}

class _ImageSETState extends State<ImageSET> {

   File? imageFile;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(

                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("GALLERY"),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    child: Text('camera'),
                    onPressed: () {
                      _getFromCamera();
                    },
                  )
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
            )));

  }

   _getFromGallery() async {
     PickedFile? pickedFile = await ImagePicker().getImage(
       source: ImageSource.gallery,
       maxWidth: 1800,
       maxHeight: 1800,
     );
     if (pickedFile != null) {
       setState(() {
         imageFile = File(pickedFile.path);
       });
     }
   }

   /// Get from Camera
   _getFromCamera() async {
     PickedFile? pickedFile = await ImagePicker().getImage(
       source: ImageSource.camera,
       maxWidth: 1800,
       maxHeight: 1800,
     );
     if (pickedFile != null) {
       setState(() {
         imageFile = File(pickedFile.path);
       });
     }
   }
}


