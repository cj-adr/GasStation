import 'package:flutter/widgets.dart';

class ImageUtils {
  static ImageIcon imageIcon(
    String name,
    double size, {
    ImageType type = ImageType.PNG,
  }) {
    return ImageIcon(
      AssetImage(
        'assets/images/' + name + _getSuffixName(type),
      ),
      size: 20,
    );
  }

  static Image assetImage(
    String name, {
    ImageType type = ImageType.PNG,
    double scale = 4,
    double width = 0,
    double height = 0,
  }) {
    if (width != 0 && height != 0) {
      return Image.asset(
        'assets/images/' + name + _getSuffixName(type),
        width: width,
        height: height,
      );
    } else
      return Image.asset(
        'assets/images/' + name + _getSuffixName(type),
        scale: scale,
      );
  }

  static String _getSuffixName(ImageType type) {
    if (type == ImageType.PNG) {
      return '.png';
    } else {
      return '.jpg';
    }
  }
}

enum ImageType {
  PNG,
  JPG,
}
