import 'dart:convert';

// Function to deserialize JSON into a list of ProductEntry
List<ProductEntry> productEntryFromJson(String str) =>
    List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

// Function to serialize a list of ProductEntry into JSON
String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String pk; // Primary key
  Fields fields;

  ProductEntry({
    required this.pk,
    required this.fields,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int price;
  int stock;
  String description;
  String category;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.category,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        description: json["description"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "stock": stock,
        "description": description,
        "category": category,
      };
}
