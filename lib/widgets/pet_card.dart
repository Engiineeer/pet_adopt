import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/pets_model.dart';
import '../providers/pet_provider.dart';

class PetCard extends StatelessWidget {
  final Color? iconColor;
  const PetCard({required this.pet, super.key, this.iconColor});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        pet.name,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      subtitle: Text("gender: ${pet.gender} age: ${pet.age}"),
      leading: Image.network(
        pet.image,
        height: 100,
        width: 100,
      ),
      trailing: Column(
        children: [
          InkWell(
            onTap: () => context.read<PetProvider>().deletePet(pet.id),
            child: Icon(
              Icons.delete,
              color: iconColor ?? Colors.red,
            ),
          ),
          InkWell(
            onTap: () => context.push("/edit", extra: pet),
            child: Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
    );
  }
}
