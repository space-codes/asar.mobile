/// results : [{"result":"string","image":"string","id":0}]

class HomeResponse {
  HomeResponse({
      List<Results>? results,}){
    _results = results;
}

  HomeResponse.fromJson(dynamic json) {
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
  }
  List<Results>? _results;
HomeResponse copyWith({  List<Results>? results,
}) => HomeResponse(  results: results ?? _results,
);
  List<Results>? get results => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// result : "string"
/// image : "string"
/// id : 0

class Results {
  Results({
      String? result, 
      String? image, 
      int? id,}){
    _result = result;
    _image = image;
    _id = id;
}

  Results.fromJson(dynamic json) {
    _result = json['result'];
    _image = json['image'];
    _id = json['id'];
  }
  String? _result;
  String? _image;
  int? _id;
Results copyWith({  String? result,
  String? image,
  int? id,
}) => Results(  result: result ?? _result,
  image: image ?? _image,
  id: id ?? _id,
);
  String? get result => _result;
  String? get image => _image;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['image'] = _image;
    map['id'] = _id;
    return map;
  }

}