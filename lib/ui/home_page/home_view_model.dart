import 'package:stacked/stacked.dart';
import 'package:test_stacked_sliver_app_bar/main.dart';
import 'package:test_stacked_sliver_app_bar/models/recipes.dart';
import 'package:test_stacked_sliver_app_bar/services/api_service.dart';

class HomeViewModel extends BaseViewModel {
  List<Recipes> recipesList = [];

  Future<void> fetchRecipes() async {
    recipesList = (await getIt<ApiService>().fetchRecipes());
    notifyListeners();
  }
}
