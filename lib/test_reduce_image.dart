// import 'package:image/image.dart' as image;
// import 'package:flutter/material.dart';

// // Ex: Image newImage = scaleImageCentered(oldImage, 512, 512, image.getColor(0, 0, 255));
// image.Image scaleImageCentered(
//     image.Image source, int maxWidth, int maxHeight, int colorBackground) {
//   final double scaleX = source.width / maxWidth;
//   final double scaleY = source.height / maxHeight;
//   final double scale = (scaleX * source.height > maxHeight) ? scaleY : scaleX;
//   final int width = (source.width * scale).round();
//   final int height = (source.height * scale).round();
//   return image.drawImage(
//       new image.Image(maxWidth, maxHeight)..fill(colorBackground),
//       image.copyResize(source, width, height),
//       dstX: ((maxWidth - width) / 2).round(),
//       dstY: ((maxHeight - height) / 2).round());
// }
