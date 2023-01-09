import 'dart:convert';

class Items {
  String? titleItems;
  String? descriptionItems;
  double? priceItems;
  Items({
    this.titleItems,
    this.descriptionItems,
    this.priceItems,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titleItems': titleItems,
      'descriptionItems': descriptionItems,
      'priceItems': priceItems,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      titleItems:
          map['titleItems'] != null ? map['titleItems'] as String : null,
      descriptionItems: map['descriptionItems'] != null
          ? map['descriptionItems'] as String
          : null,
      priceItems:
          map['priceItems'] != null ? map['priceItems'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);
}
