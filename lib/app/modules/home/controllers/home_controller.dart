import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../api/services/pokemon_services.dart';
import '../../../moduls/pokimon.dart';

class HomeController extends GetxController {
  Rx<bool> isLoading = true.obs;
  Rx<bool> isPagination = true.obs;

  RxList<PokemonModel> pokeMonList = <PokemonModel>[].obs;
  int offset = 0;
  int limit = 10;
  final scrollController = ScrollController();

  @override
  void onInit() {
    fetchPokemon();

    scrollController.addListener(() {
      log("Scroll Position: ${scrollController.position.pixels}, Max: ${scrollController.position.maxScrollExtent}");

      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        if (!isPagination.value) {
          fetchPokemon(loadMore: true);
        }
      }
    });

    super.onInit();
  }

  Future<void> fetchPokemon({bool loadMore = false}) async {
    try {
      if (loadMore) {
        isPagination.value = true;
        offset += limit;
        log('=============> call load more 00');
      } else {
        isLoading.value = true;
        offset = 0;
        pokeMonList.clear();
      }
      final data = await PokemonServices().getPokemon(offset, limit);
      if (data != null && data.isNotEmpty) {
        if (loadMore) {
          pokeMonList.addAll(data);
        } else {
          pokeMonList.assignAll(data);
        }
      }
    } catch (e) {
      log('============> $e');
    } finally {
      isLoading.value = false;
      isPagination.value = false;
    }
  }
}


// filterCategories() {
//
//   var selectedCategoryModel = categoryList.firstWhere(
//           (category) => category.name == selectedCategory.value,
//       orElse: () => CategoryModel()
//   );
//
//   filteredCategoryList.value = selectedCategoryModel.subCategory ?? [];
//   update();
//   log('Filtered subcategories count: ${filteredCategoryList.length}');
//   log('=================================>Filtered categories: ${filteredCategoryList.length}');
//   log('=================================>Filtered categories: ${filteredCategoryList[0].name}');
// }
