import 'dart:io';

import 'package:dinewell/Constance/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class UtilsFunctions{

  static bool isValidEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  static displayToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 18);
  }

  static showCustomDialogue(BuildContext context,{String title = 'Loading'}){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            content: new Row(
            children: [
            CircularProgressIndicator(color: Theme.of(context).primaryColor,),
            Container(margin: EdgeInsets.only(left: 10),child:Text(title)),
        ],));
      },
    );
  }


  static Future<File?> selectPicture({required ImageSource source}) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      var imageFile = File(image.path);

      // Crop the image
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.secondary,
            toolbarWidgetColor: Colors.white,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false
          ),
          IOSUiSettings(
            title: 'Cropper',
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              // IMPORTANT: iOS supports only one custom aspect ratio in preset list
            ],
          ),

        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
    }
    return null;
  }

  static Future<void> launchScreen(String url) async {
    final call = Uri.parse(url);
    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      throw 'Could not launch $call';
    }
  }

  static Widget QrScannerView({String? url}){
    return QrImageView(
      data:url ?? 'This is a simple QR code',
      version: QrVersions.auto,
      size: 88,
      gapless: true,
    );
  }


  static Future<File> imageToFile({String? imageName}) async {
    var bytes = await rootBundle.load('${imageName}');
    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/profile.png');
    await file.writeAsBytes(
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    return file;
  }

}