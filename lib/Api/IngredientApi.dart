import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  List<Result> results;
  int offset;
  int number;
  int totalResults;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        offset: json["offset"],
        number: json["number"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "offset": offset,
        "number": number,
        "totalResults": totalResults,
      };
}

class Result {
  Result({
    required this.id,
    required this.name,
    required this.image,
    required this.aisle,
    required this.possibleUnits,
  });

  int id;
  String name;
  String image;
  String aisle;
  List<String> possibleUnits;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        aisle: json["aisle"],
        possibleUnits: List<String>.from(json["possibleUnits"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "aisle": aisle,
        "possibleUnits": List<dynamic>.from(possibleUnits.map((x) => x)),
      };
}



// import 'dart:convert';

// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Post {
//   Post({
//     required this.userId,
//     required this.id,
//     required this.title,
//     this.body,
//   });

//   int userId;
//   int id;
//   String title;
//   String? body;

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         userId: json["userId"],
//         id: json["id"],
//         title: json["title"],
//         body: json["body"],
//       );

//   Map<String, dynamic> toJson() => {
//         "userId": userId,
//         "id": id,
//         "title": title,
//         "body": body,
//       };
// }
