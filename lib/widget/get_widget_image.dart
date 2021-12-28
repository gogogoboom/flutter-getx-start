import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';
import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

Widget circleImageView(
  String? url, {
  required double size,
  String? defaultImagePath,
}) {
  return GFAvatar(
    backgroundImage: _networkImageProvider(defaultImagePath, url),
    size: size,
  );
}

ClipRRect roundedImageView(String url,
    {double radius = 6,
    required double width,
    required double height,
    BorderRadius? borderRadius,
    String? defaultImagePath}) {
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(radius),
    child: fetchImage(url,
        width: width, height: height, defaultImagePath: defaultImagePath),
  );
}

Widget roundedImageViewWithBorder(
  String url, {
  double border = 1.0,
  required double width,
  required double height,
  double radius = 6,
}) {
  return Container(
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(width: border, color: Get.theme.shadowColor),
      ),
    ),
    child: roundedImageView(url, width: width, height: height, radius: radius),
  );
}

ClipRRect roundedTopImageView(
  String url, {
  double radius = 6,
  required double width,
  required double height,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
    child: fetchImage(url, width: width, height: height),
  );
}

ClipRRect roundedImageViewWithNoHolder(
  String url, {
  double radius = 6,
  required double width,
  required double height,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: fetchImage(
      url,
      width: width,
      height: height,
      defaultImagePath: '',
    ),
  );
}

ClipRRect roundedLocalImageView(
  File file, {
  double radius = 6,
  required double width,
  required double height,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: fetchLocalImage(
      file,
      width: width,
      height: height,
    ),
  );
}

ClipRRect roundedAssetsImageView(
  String path, {
  double radius = 6,
  required double width,
  required double height,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: fetchAssetsImage(
      path,
      width: width,
      height: height,
    ),
  );
}

Widget avatarWithBorder(String? url, double size,
    {double border = 2.0,
    Color? borderColor,
    String? imgRes}) {
  return Container(
    decoration: ShapeDecoration(
      shape: CircleBorder(
        side: BorderSide(
          width: border,
          color: borderColor ?? commonConfig.defaultAvatarBorderColor,
        ),
      ),
    ),
    child: ClipOval(
      child: fetchImage(url ?? commonConfig.defaultAvatarRes,
          width: size, height: size, defaultImagePath: imgRes),
    ),
  );
}

Widget localLogoWithBorder(
  File? file,
  double size, {
  double border = 2.0,
  String? imgRes,
}) {
  return Container(
    decoration: ShapeDecoration(
      shape: CircleBorder(
        side: BorderSide(
          width: border,
          color: Get.theme.shadowColor,
        ),
      ),
    ),
    child: GFAvatar(
      backgroundImage: _imageProvider(imgRes ?? commonConfig.logoRes, file),
      size: size,
    ),
  );
}

ImageProvider? _imageProvider(String imgRes, File? file) => file == null
    ? AssetImage(Utils.getImgPath(imgRes))
    : FileImage(file) as ImageProvider?;

ImageProvider? _networkImageProvider(String? imgRes, String? url) =>
    (url?.isEmpty ?? true)
        ? AssetImage(Utils.getImgPath(imgRes ?? commonConfig.defaultAvatarRes))
        : CachedNetworkImageProvider(url ?? '') as ImageProvider?;
