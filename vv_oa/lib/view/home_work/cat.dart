
abstract class CatInterface{
    int get id;
    //类目名称
    String get name;
    //描述
    String get desc;
    //第几级类目，默认 1
    int get depth;
    //父类目id，没有为 0
    int get parentId;
}

class Cat implements CatInterface {
  int id;
  String name;
  String desc;
  String engName;
  int depth;
  int parentId;
  List<Cat> children;

  Cat({this.id, this.name, this.desc, this.depth, this.parentId,this.children,this.engName});

  Cat.fromJSON(Map json)
      : id = json['id'],
        name = json['name'],
        desc = json['desc'],
        depth = json['depth'],
        parentId = json['parentId'];

  String toString() {
    return '(Cat $name)';
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'depth': depth,
      'parentId': parentId
    };
  }
  Map toSqlCondition() {
    Map _map = this.toMap();
    Map condition = {};
    _map.forEach((k, value) {

      if (value != null) {

        condition[k] = value;
      }
    });

    if (condition.isEmpty) {
      return {};
    }

    return condition;
  }
}