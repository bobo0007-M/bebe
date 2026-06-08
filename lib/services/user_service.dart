import 'package:bebe/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
    final database = FirebaseFirestore.instance;
    Future<void> createUser(AppUser user) async{
        await database.collection("user").doc(user.uid).set(user.toJson());
    }
    Future<void> updateUser(AppUser user)async{
        await database.collection("user").doc(user.uid).update(user.toJson());
    }
    Future<AppUser?> getUser(AppUser user) async {
        final doc = await database.collection("users").doc(user.uid).get();
        if(!doc.exists) {
            return AppUser.fromJson(doc.data() as Map<String, dynamic>);
        }
        return null;

    }
Stream<List<AppUser>> get getAllUsers {
    final snapshot = database.collection("user").snapshots();
    return snapshot.map((doc){
        return doc.docs.map((event){
            return AppUser.fromJson(event.data());
        }).toList();
    });
    

} 


    Future<void> deleteUser(String uid) async{
        await database.collection("user").doc(uid).delete();
    }
}