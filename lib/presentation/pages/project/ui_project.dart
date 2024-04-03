import 'package:test_intern/resources/export/core_export.dart';

class UIProject {
  final int id;
  final String imageUrl;

  UIProject({
    required this.id,
    required this.imageUrl,
  });
  // truyền id vào để lấy ra ảnh
  void getImages(String id) {}
}

List<UIProject> listImageProject = [UIProject(id: 1, imageUrl: ImagesPath.avata_project_1)];
