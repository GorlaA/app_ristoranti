import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewService{
  getLatestReview(String clientName, String clientContact){
    return FirebaseFirestore.instance.collection('reviews')//Queta é la raccolta
        .where('clientName', isEqualTo: clientName) //queste sono i campi
        .where('clientContact', isEqualTo: clientContact)
        .orderBy('timeStamp', descending: true)
        .get();
  }
}