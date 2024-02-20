// ignore_for_file: deprecated_member_use, file_names

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_intern/core/hepler/app-validate.dart';
import 'package:test_intern/core/hepler/size-app.dart';
import 'package:test_intern/resources/images_path.dart';

import '../../resources/app_color.dart';
import '../enums/enums.dart';


// ignore: must_be_immutable
class AppImage extends StatelessWidget {
  AppImage(
    String this.urlImage, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.colorIconsSvg,
  }) : super(key: key);
  AppImage.file(
    this.file, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : super(key: key);
  AppImage.icon(
    IconData this.icon, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color = ColorResources.OUTER_SPACE,
    this.size,
  }) : super(key: key);
  String? urlImage;
  final double? width;
  final double? height;
  final BoxFit? fit;
  File? file;
  IconData? icon;
  Color? color;
  Color? colorIconsSvg;
  double? size;

  AppImageType checkImageType(String url) {
    if (AppValidate.nullOrEmpty(url) && AppValidate.nullOrEmpty(file) && AppValidate.nullOrEmpty(icon)) {
      return AppImageType.NOT_IMAGE;
    }
    if (url.endsWith(".svg")) {
      return AppImageType.SVG;
    }
    return AppImageType.IMAGE;
  }

  AppImageUrlType checkImageUrlType(String url) {
    if (AppValidate.nullOrEmpty(url)) {
      if (icon != null) {
        return AppImageUrlType.ICON;
      }
      return AppImageUrlType.FILE;
    }
    if (url.startsWith('http') || url.startsWith('https')) {
      return AppImageUrlType.NETWORK;
    } else if (url.startsWith('assets/')) {
      return AppImageUrlType.ASSET;
    } else if (icon != null) {
      if (icon!.fontFamily.toString().toLowerCase().contains('CupertinoIcons'.toLowerCase()) ||
          icon!.fontFamily.toString().toLowerCase().contains('MaterialIcons'.toLowerCase())) {
        return AppImageUrlType.ICON;
      }
      return AppImageUrlType.FILE;
    }
    return AppImageUrlType.FILE;
  }

  Widget imageTypeWidget(String urlImage, AppImageType imageType, AppImageUrlType imageUrlType) {
    if (imageType == AppImageType.IMAGE) {
      if (imageUrlType == AppImageUrlType.NETWORK) {
        return CachedNetworkImage(
          imageUrl: urlImage,
          fadeOutDuration: Duration.zero,
          fadeInDuration: Duration.zero,
          width: width,
          height: height,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: fit,
              ),
            ),
          ),
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Image.asset(
            ImagesPath.placeHolder,
            fit: fit,
            height: height ?? SizeApp.setSizeWithWidth(percent: .1),
            width: width ?? SizeApp.setSizeWithWidth(percent: .1),
          ),
        );
      } else if (imageUrlType == AppImageUrlType.ASSET) {
        return Image.asset(
          urlImage,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImagesPath.placeHolder,
              fit: fit,
              height: height ?? SizeApp.setSizeWithWidth(percent: .1),
              width: width ?? SizeApp.setSizeWithWidth(percent: .1),
            );
          },
        );
      } else if (imageUrlType == AppImageUrlType.FILE) {
        return Image.file(
          file!,
          fit: fit,
          height: height,
          width: width,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              ImagesPath.placeHolder,
              fit: fit,
              height: height ?? SizeApp.setSizeWithWidth(percent: .1),
              width: width ?? SizeApp.setSizeWithWidth(percent: .1),
            );
          },
        );
      } else if (imageUrlType == AppImageUrlType.ICON) {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(
            icon,
            color: color,
            size: size ?? SizeApp.setSize(percent: .08),
          ),
        );
      }
    }

    if (imageType == AppImageType.SVG) {
      if (imageUrlType == AppImageUrlType.NETWORK) {
        return SvgPicture.network(
          urlImage,
          fit: fit!,
          height: height,
          width: width,
          placeholderBuilder: (BuildContext context) => const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else if (imageUrlType == AppImageUrlType.ASSET) {
        return SvgPicture.asset(
          urlImage,
          fit: fit!,
          height: height,
          width: width,
          color: colorIconsSvg,
          placeholderBuilder: (BuildContext context) => const SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else if (imageUrlType == AppImageUrlType.FILE) {
        return Expanded(
          child: SvgPicture.file(
            file!,
            fit: fit!,
            height: height,
            width: width,
            placeholderBuilder: (BuildContext context) => const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      } else if (imageUrlType == AppImageUrlType.ICON) {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(
            icon,
            color: color,
          ),
        );
      }
    }

    if (imageType == AppImageType.NOT_IMAGE) {
      return Image.asset(
        ImagesPath.placeHolder,
        fit: fit,
        width: width ?? SizeApp.setSizeWithWidth(percent: .1),
        height: height ?? SizeApp.setSizeWithWidth(percent: .1),
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final imageType = checkImageType(urlImage.toString());
    final imageUrlType = checkImageUrlType(urlImage.toString());
    return imageTypeWidget(
      urlImage.toString(),
      imageType,
      imageUrlType,
    );
  }
}
