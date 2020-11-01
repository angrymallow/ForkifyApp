import 'package:ForkifyApp/features/recipe/data/repositories/recipe_repository_impl.dart';
import 'package:ForkifyApp/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:ForkifyApp/features/recipe/domain/usecases/search_recipes.dart';
import 'package:ForkifyApp/features/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RecipeBloc(searchRecipes: sl()));
  sl.registerLazySingleton(() => SearchRecipes(sl()));
  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton(() => http.Client);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
