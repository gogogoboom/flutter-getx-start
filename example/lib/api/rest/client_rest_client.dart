import 'dart:io';

import 'package:gogoboom_flutter_getx_start/gogoboom_flutter_getx_start.dart';

import '../../models/upload_image.dart';

part 'client_rest_client.g.dart';

@RestApi()
abstract class ClientRestClient {
  factory ClientRestClient(Dio dio, {String? baseUrl}) = _ClientRestClient;

  ///上传图片
  @POST('/files/upload')
  @Headers(<String, dynamic>{
    'Content-Type': 'multipart/form-data',
    'loading': 'true'
  })
  @MultiPart()
  Future<List<UploadImage>> uploadFiles(@Part() List<File> files);
}
