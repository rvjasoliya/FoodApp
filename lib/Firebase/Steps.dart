import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> AddSteps(
    var Recipeid, var StepTitle, var Hour, var Minutes, var Decsription) {
  CollectionReference Steps = FirebaseFirestore.instance.collection('Steps');
  String Stepsid = Steps.doc().id;

  return Steps.doc(Stepsid).set({
    'id': Stepsid,
    'recipeId': Recipeid,
    'Title': StepTitle,
    'Hour': Hour,
    'Minutes': Minutes + 1,
    'Decsription': Decsription
  }).then((value) {
    print("Steps Details Added");
  });
}
