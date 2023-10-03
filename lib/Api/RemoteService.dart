import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Firebase/Indgredient.dart';
import 'IngredientApi.dart';

List<Result> listt = [];
fetchAlbum(query, number, offset) async {
  print("fetchAlbum");
  final uri = Uri.parse('https://api.spoonacular.com/food/ingredients/search')
      .replace(queryParameters: {
    'query': '$query',
    'metaInformation': 'true',
    'apiKey': '<apiKey>',
    'number': '$number',
    'offset': '$offset'
  });
  print("URI ${uri}");
  final response = await http.get(uri);

  print("response");
  print("statusCode ${response.statusCode}");

  if (response.statusCode == 200) {
    // return Post.fromJson(jsonDecode(response.body)).results;
    var post = Post.fromJson(jsonDecode(response.body));
    print('post');
    print('length ${post.results.length}');
    print('totalResults ${post.totalResults}');
    //  listt.add(post.results);
    listt.addAll(post.results);
    print('listt');
    print('listt length ${listt.length}');
    if (listt.length == post.totalResults) {
      print("Done");
      for (var i = offset; i < 229; i++) {
        (addIndgredient(
          '${post.results[i].id}',
          '${post.results[i].name}',
          '${post.results[i].image}',
          '${post.results[i].aisle}',
          '${post.results[i].possibleUnits}',
        ));
      }
    } else {
      print("Fetch Done ${offset}");
      fetchAlbum(query, number, listt.length);
    }
  } else {
    throw Exception('Failed to load');
  }
}
// final uri1 = Uri.parse('https://api.spoonacular.com/food/ingredients/search');
//   final uri2 = uri1.replace(queryParameters: {
//     'query': '$query',
//     'metaInformation': 'true',
//     'apiKey': '<apiKey>',
//     'number': number,
//     'offset': offset
//   });

// getPosts() async {
//   http.Response res = await http
//       .get(Uri.parse('https://api.spoonacular.com/food/ingredients/search'));

//   if (res.statusCode == 200) {
//     List<dynamic> body = jsonDecode(res.body);

//     List<Post> posts = body
//         .map(
//           (dynamic item) => Post.fromJson(item),
//         )
//         .toList();

//     return posts;
//   } else {
//     throw "Unable to retrieve posts.";
//   }
// }

// import 'package:http/http.dart' as http;

// import 'IngredientApi.dart';

// class RemoteService {
//   Future<List<Post>?> getPosts() async {
//     var client = http.Client();
//     var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return postFromJson(json);
//     }
//   }
// }
