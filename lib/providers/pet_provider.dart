import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../client.dart';
import '../models/pets_model.dart';

// "https://coded-books-api-crud.herokuapp.com/books"
class PetProvider extends ChangeNotifier {
  List<Pet> pets = [];
  bool isLoading = false;

  PetProvider() {
    loadPets();
  }

  Future<void> loadPets() async {
    isLoading = true;
    notifyListeners();

    pets.clear();

    var response = await Client.dio.get("/pets");

    var petJsonList = response.data as List;

    pets = petJsonList.map((petJson) => Pet.fromMap(petJson)).toList();

    pets.sort((a, b) => a.name.compareTo(b.name));

    isLoading = false;

    notifyListeners();
  }

  Future<void> addPet({
    required String name,
    required String gender,
    required int age,
    required File image,
  }) async {
    var response = await Client.dio.post("/pets",
        data: FormData.fromMap({
          "name": name,
          "gender": gender,
          "age": age,
          "image": await MultipartFile.fromFile(image.path),
          "adopted": false,
        }));

    loadPets();
  }

  Future<void> editPet({
    required int id,
    required String name,
    required String gender,
    required int age,
    required File image,
  }) async {
    var response = await Client.dio.put("/pets/${id}",
        data: FormData.fromMap({
          "name": name,
          "gender": gender,
          "age": age,
          "image": await MultipartFile.fromFile(image.path),
        }));

    loadPets();
  }

  void deletePet(int id) async {
    await Client.dio.delete('/pets/$id');

    loadPets();
  }
}
