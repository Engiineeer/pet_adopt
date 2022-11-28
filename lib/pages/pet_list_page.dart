import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/pet_provider.dart';
import '../widgets/pet_card.dart';

class PetListPage extends StatefulWidget {
  const PetListPage({super.key});

  @override
  State<PetListPage> createState() => _PetListPageState();
}

class _PetListPageState extends State<PetListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pet List")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/add");
        },
        child: Icon(Icons.add),
      ),
      body: context.watch<PetProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: context.watch<PetProvider>().pets.length,
              itemBuilder: (context, index) => PetCard(
                pet: context.watch<PetProvider>().pets[index],
              ),
            ),
    );
  }
}
