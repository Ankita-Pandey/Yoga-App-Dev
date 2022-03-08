import 'dart:convert';

import 'package:yoga/app/app.logger.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yoga/exceptions/firestore_api_exception.dart';
import 'package:yoga/models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser({required User user}) async {
    log.v('user:$user');
    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future checkUser({required User user}) async {
    try {
      final userDocument = usersCollection.where('id', isEqualTo: user.id);

      userDocument.get().then((value) {
        // ignore: unnecessary_null_comparison
        if (value == null) {
          log.v('User is nul');
        }
      });
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  Future<void> updateUser(
      {required Map<String, dynamic> data, required String user}) async {
    try {
      final userDocument = usersCollection.doc(user);
      userDocument.update(data);
      log.v('Users Data updated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to update user data',
        devDetails: '$error',
      );
    }
  }

  Future<User?> getUser({required String userId}) async {
    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }
      Object? data = userDoc.data();
      String s = json.encode(data!);
      Map<String, dynamic> user = jsonDecode(s);
      return User.fromJson(user);
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Please pass in a valid user if from your Firebase user.');
    }
  }
}
