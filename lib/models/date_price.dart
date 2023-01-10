import 'dart:convert';

class DatePrice {
  DateTime? date;
  double? price;
  DatePrice({
    this.date,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date?.millisecondsSinceEpoch,
      'price': price,
    };
  }

  factory DatePrice.fromMap(Map<String, dynamic> map) {
    return DatePrice(
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : null,
      price: map['price'] != null ? map['price'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DatePrice.fromJson(String source) =>
      DatePrice.fromMap(json.decode(source) as Map<String, dynamic>);
}
