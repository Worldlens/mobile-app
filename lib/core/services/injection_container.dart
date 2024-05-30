import 'package:flutter_application_1/module/history/data/datasources/history_remote_data_source.dart';
import 'package:flutter_application_1/module/history/data/repo/history_repo_impl.dart';
import 'package:flutter_application_1/module/history/domain/repo/history_repo.dart';
import 'package:flutter_application_1/module/history/domain/usecase/get_submitted_item.dart';
import 'package:flutter_application_1/module/history/presentation/cubit/submitted_product_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl
    //////logic
    ..registerFactory(() => SubmittedProductCubit(getSubmittedItems: sl()))
    ..registerLazySingleton(() => GetSubmittedItemUseCase(sl()))
    ..registerLazySingleton<HistoryRepo>(() => HistoryRepoIpmpl(sl()))
    ..registerLazySingleton<HistoryRemoteDataSrc>(
        () => HistoryRemoteDataSrcImpl(client: sl()))
    ..registerLazySingleton(http.Client.new);
}
