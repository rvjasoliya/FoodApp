import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/Api/RemoteService.dart';

import 'IngredientApi.dart';

class Fire extends StatefulWidget {
  const Fire({Key? key}) : super(key: key);

  @override
  State<Fire> createState() => _FireState();
}

//  List<Ingredient>? posts;
Post? posts;

class _FireState extends State<Fire> {
  @override
  void initState() {
    fetchAlbum('a', '100', '0');
    super.initState();
  }
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // getData() async {
  // print("getData call");
  // posts = (await fetchAlbum()) as Post?;
  // }
  // getData() async {
  //   posts = await RemoteService().getPosts();
  //   if (Ingredient != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      // body: SafeArea(
      //   child: FutureBuilder<List<Result>>(
      //     future: fetchAlbum(
      //         'a', 100, 0), // a previously-obtained Future<String> or null
      //     builder:
      //         (BuildContext context, AsyncSnapshot<List<Result>> snapshot) {
      //       if (snapshot.hasData) {
      //         return Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: const [],
      //           ),
      //         );
      //       } else {
      //         return Container();
      //       }
      //     },
      //   ),
      // body: fetchAlbum('a', 100, 0),
    );
  }
}
