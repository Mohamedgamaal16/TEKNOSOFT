import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:mime/mime.dart';
Future uploadImageToAPI(XFile image) async {
  // return MultipartFile.fromFile(image.path,
  //     filename: image.path.split('/').last,
  //    );


      final mimeTypeData =
          lookupMimeType(image.path, headerBytes: [0xFF, 0xD8])!.split('/');
          
          return MultipartFile.fromFile(
            image.path,
            filename: basename(image.path),
            contentType: MediaType(mimeTypeData[0],
                mimeTypeData[1]), // Set the correct content type
          );
}
