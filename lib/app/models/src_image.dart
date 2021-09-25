class SrcImage{
  String? original;
  String? large2x;
  String? large;
  String? medium;
  String? small;
  String? portrait;
  String? landscape;
  String? tyni;

  SrcImage({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tyni,
  });

  SrcImage.fromJson(Map<String, dynamic> json){
    original = json['original'];
    large2x = json['large2x'];
    large = json['large'];
    medium = json['medium'];
    small = json['small'];
    portrait = json['portrait'];
    landscape = json['landscape'];
    tyni = json['tyni'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['original'] = this.original;
    data['large2x'] = this.large2x;
    data['large'] = this.large;
    data['medium'] = this.medium;
    data['small'] = this.small;
    data['portrait'] = this.portrait;
    data['landscape'] = this.landscape;
    data['tyni'] = this.tyni;
    return data;
  }
}