class Messagemodel {
  final String message;
  final String id;
  Messagemodel(this.id, this.message);
  factory Messagemodel.fromjson(jsondata) {
    return Messagemodel(jsondata['id'], jsondata['message']);
  }
}
