
class ChuckNorris {
  List<dynamic> _categories;
  String _createdAt;
  String _iconUrl;
  String _id;
  String _updatedAt;
  String _url;
  String _value;

  List<dynamic> get categories => _categories;
  String get createdAt => _createdAt;
  String get iconUrl => _iconUrl;
  String get id => _id;
  String get updatedAt => _updatedAt;
  String get url => _url;
  String get value => _value;

  ChuckNorris({
      List<dynamic> categories, 
      String createdAt, 
      String iconUrl, 
      String id, 
      String updatedAt, 
      String url, 
      String value}){
    _categories = categories;
    _createdAt = createdAt;
    _iconUrl = iconUrl;
    _id = id;
    _updatedAt = updatedAt;
    _url = url;
    _value = value;
}

  ChuckNorris.fromJson(dynamic json) {
    _categories = [];
    _createdAt = json["created_at"];
    _iconUrl = json["icon_url"];
    _id = json["id"];
    _updatedAt = json["updated_at"];
    _url = json["url"];
    _value = json["value"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_categories != null) {
      map["categories"] = _categories.map((v) => v.toJson()).toList();
    }
    map["created_at"] = _createdAt;
    map["icon_url"] = _iconUrl;
    map["id"] = _id;
    map["updated_at"] = _updatedAt;
    map["url"] = _url;
    map["value"] = _value;
    return map;
  }

}