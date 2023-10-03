// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> AddRecipe(List Image, var SelectNum, var Servings, var YouTubeLink,
    var RecipeIngredient, var RecipeSteps) {
  CollectionReference Recipes =
      FirebaseFirestore.instance.collection('Recipes');
  // Current User Id Fatch Krva --
  FirebaseAuth auth = FirebaseAuth.instance;
  // New Id Create Thy AutoMatic --
  String Recipeid = Recipes.doc().id;

  //
  //
  // print('Recipe Id : ${Recipeid}');
  // print('User Id   : ${auth.currentUser!.uid.toString()}');

  // print(Recipes.path);
  // Recipes.doc(uid).update();
  // Image.join(',');

  return Recipes.doc(Recipeid).set({
    'UserId': auth.currentUser!.uid.toString(),
    'id': Recipeid,
    'Image': Image.join(','),
    'SelectedContainer': SelectNum,
    'servings': '$Servings',
    'youtubeLink': '$YouTubeLink',
    'ingredients': '$RecipeIngredient',
    'RecipeSteps': '$RecipeSteps',
  }).then((value) {
    print("Recipe Details Added");
  });
}

// return Recipes.doc(Recipeid).set({
//     'UserId': Userid,
//     'id': Recipeid,
//     'Image': {
//     {
//       "":"",
//       "":""
//     },
//     {
//       "":""
//     },
