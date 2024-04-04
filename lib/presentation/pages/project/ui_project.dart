import 'package:test_intern/resources/export/core_export.dart';

class UIProject {
  final int? id;
  final String? imageUrl;

  UIProject({
    this.id,
    this.imageUrl,
  });
  // truyền id vào để lấy ra ảnh
  String getImages(int id) {
    return listImageProject.firstWhere((element) => element.id == id).imageUrl ?? '';
  }
}

List<UIProject> listImageProject = [
  UIProject(id: 1, imageUrl: ImagesPath.avata_project_1),
  UIProject(id: 2, imageUrl: ImagesPath.avata_project_2),
  UIProject(id: 3, imageUrl: ImagesPath.avata_project_3),
  UIProject(id: 4, imageUrl: ImagesPath.avata_project_4),
  UIProject(id: 5, imageUrl: ImagesPath.avata_project_5),
  UIProject(id: 6, imageUrl: ImagesPath.avata_project_6),
  UIProject(id: 7, imageUrl: ImagesPath.avata_project_7),
  UIProject(id: 8, imageUrl: ImagesPath.avata_project_8),
  UIProject(id: 10, imageUrl: ImagesPath.avata_project_10),
  UIProject(id: 11, imageUrl: ImagesPath.avata_project_11),
  UIProject(id: 12, imageUrl: ImagesPath.avata_project_12),
  UIProject(id: 13, imageUrl: ImagesPath.avata_project_13),
  UIProject(id: 14, imageUrl: ImagesPath.avata_project_14),
  UIProject(id: 15, imageUrl: ImagesPath.avata_project_15),
  UIProject(id: 16, imageUrl: ImagesPath.avata_project_16),
  UIProject(id: 17, imageUrl: ImagesPath.avata_project_17),
  UIProject(id: 18, imageUrl: ImagesPath.avata_project_18),
];
