import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onsaemiro/repo/image_helper.dart';

Imageservice imageservice = Imageservice();

class Imageservice {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference clubCollection =
      FirebaseFirestore.instance.collection('clubs');

  Future<String> uploadProfileImageToStorage(XFile result) async {
    User? _user = _firebaseAuth.currentUser;

    File image = File(result.path);
    Reference storageReference =
        firebaseStorage.ref().child("profile/${_user?.uid}");

    final File resultImage = await compute(getResizedProfileImage, image);

    final UploadTask uploadTask = storageReference.putFile(resultImage);

    String downloadURL = await (await uploadTask).ref.getDownloadURL();

    await userCollection.doc(_user?.uid).update({'image': downloadURL});

    return downloadURL;
  }

  Future<String> uploadProductImageToStorage(String name, XFile result) async {
    File image = File(result.path);
    Reference storageReference = firebaseStorage.ref().child("Product/$name");

    final File resultImage = await compute(getResizedProfileImage, image);

    final UploadTask uploadTask = storageReference.putFile(resultImage);

    String downloadURL = await (await uploadTask).ref.getDownloadURL();

    return downloadURL;
  }

  Future<String> uploadBusinessImageToStorage(String name, XFile result) async {
    File image = File(result.path);
    Reference storageReference = firebaseStorage.ref().child("Business/$name");

    final File resultImage = await compute(getResizedProfileImage, image);

    final UploadTask uploadTask = storageReference.putFile(resultImage);

    String downloadURL = await (await uploadTask).ref.getDownloadURL();

    return downloadURL;
  }
}
