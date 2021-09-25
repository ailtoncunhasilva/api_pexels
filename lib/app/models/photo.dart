import 'src_image.dart';

class Photo{
  SrcImage? src;
  String? photographerName;

  Photo({this.src, this.photographerName});

  Photo.fromJson(Map<String, dynamic> json){
    src = json['src'] != null ? SrcImage.fromJson(json['src']) : null;
    photographerName = json['photographer'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['src'] = this.src;
    data['photographer'] = this.photographerName;
    return data;
  }
}