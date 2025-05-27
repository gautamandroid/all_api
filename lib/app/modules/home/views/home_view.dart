import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme/app_theme_data.dart';
import '../../../../widgets/text_view.dart';
import '../../../moduls/pokimon.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextView( text: 'HomeView',),
        backgroundColor: AppThemeData.blue,
        centerTitle: true,
      ),
      body: GetBuilder(
          init: HomeController(),
          builder: (controller){
            return Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: controller.scrollController,
                      itemCount: controller.pokeMonList.length,
                      itemBuilder: (context, index) {
                        PokemonModel pokemon = controller.pokeMonList[index];
                        return GestureDetector(
                          onTap: () {
                            // Get.to(() => PokemonDetailView(), arguments: pokemon);
                          },
                          child: ListTile(leading:
                          CircleAvatar(child:
                          Text(pokemon.name?[0].toUpperCase() ?? "?")),
                              title: Text(pokemon.name ?? ''), subtitle: Text(pokemon.url ?? '')),
                        );
                      },
                    ),
                  ),
                  if (controller.isPagination.value)
                    Padding(padding: const EdgeInsets.all(12.0),
                        child: CircularProgressIndicator()),
                ],
              );
            });

          }),
    );
  }
}

