abstract class BaseModel<T> {
  T fromJson(String jsonString);

  T fromMap(Map<String, dynamic> map);

  String toJson();

  Map<String, dynamic>? toMap();
}
