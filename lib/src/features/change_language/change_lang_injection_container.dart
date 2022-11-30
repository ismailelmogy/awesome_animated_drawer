import 'package:awesome_animated_drawer/src/features/change_language/presentation/bloc/locale_bloc.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/lang_local_data_source.dart';
import 'data/repositories/lang_repository_impl.dart';
import 'domain/repositories/lang_repository.dart';
import 'domain/usecases/change_lang.dart';
import 'domain/usecases/get_saved_lang.dart';

final sl = GetIt.instance;
Future<void> initChangeLanguageFeature() async {
  sl.registerFactory<LocaleBloc>(
      () => LocaleBloc(changeLangUseCase: sl(), getSavedLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<GetSavedLang>(
      () => GetSavedLang(langRepository: sl()));
  sl.registerLazySingleton<ChangeLang>(() => ChangeLang(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<LangRepository>(
      () => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data sources
  sl.registerLazySingleton<LangLocalDataSource>(
    () => LangLocalDataSourceImpl(sharedPreferences: sl()),
  );
}
