import 'package:cloud_firestore/cloud_firestore.dart';


class DbServices {
Stream<QuerySnapshot> readCategories(){
  return FirebaseFirestore.instance
  .collection("shop_categories")
  .snapshots();
}
//create new category
Future createCategories({required Map<String,dynamic>data}) async{
  await FirebaseFirestore.instance.collection("shop_categories").add(data);
}

//update category
Future updateCategories({required String docId, required Map<String,dynamic>data}) async{
  await FirebaseFirestore.instance.collection("shop_categories").doc(docId).update(data);
}

//update category
Future deleteCategories({required String docId,}) async{
  await FirebaseFirestore.instance.collection("shop_categories").doc(docId).delete();
}

}
