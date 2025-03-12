import 'dart:io';
import 'package:image/image.dart' as img;

class ImageUtils {
  static File compressImage(File file, {int quality = 70}) {
    final image = img.decodeImage(file.readAsBytesSync());
    final compressed = img.encodeJpg(image!, quality: quality);
    return File(file.path)..writeAsBytesSync(compressed);
  }
}
