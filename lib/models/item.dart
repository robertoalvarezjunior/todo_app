import 'dart:convert';

class Item {
  String? nameItem;
  String? descriptionItem;
  Item({
    this.nameItem,
    this.descriptionItem,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameItem': nameItem,
      'descriptionItem': descriptionItem,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      nameItem: map['nameItem'] != null ? map['nameItem'] as String : null,
      descriptionItem: map['descriptionItem'] != null
          ? map['descriptionItem'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
