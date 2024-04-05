import 'dart:io';

import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageController {
  Future<File?> handleGetImageFromCamera({bool isFromCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    XFile? selectedImage;
    if (isFromCamera) {
      selectedImage = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 90,
      );
    } else {
      selectedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 90,
      );
    }

    if (selectedImage == null) return null;
    final File rotatedImage = await FlutterExifRotation.rotateImage(path: selectedImage.path);

    return rotatedImage;
  }

  Future<List<File>?> pickImageMultiple() async {
    List<XFile>? selectedImage;
    final List<File> result = [];
    selectedImage = await ImagePicker().pickMultiImage(
      imageQuality: 90,
    );

    if (selectedImage.isEmpty) return null;
    for (final element in selectedImage) {
      final File rotatedImage = await FlutterExifRotation.rotateImage(path: element.path);
      result.add(rotatedImage);
    }
    return result;
  }

  Future<File?> takeVideoFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(minutes: 1),
    );

    if (video == null) return null;

    return File(video.path);
  }

  Future<File?> takeVideoFromMedia() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickMedia();

    if (video == null) return null;

    return File(video.path);
  }
}
