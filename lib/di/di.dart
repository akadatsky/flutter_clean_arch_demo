import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:giphy_sample/bloc/bloc.dart';
import 'package:injector/injector.dart' show Injector;
import 'package:remote/remote.dart';

class Di {
  static final Di _instance = Di._internal();

  factory Di() => _instance;

  Di._internal();

  Future<void> setup() async {
    Injector.appInstance
      ..registerDependency<ListBloc>(
        () => ListBloc(
          Injector.appInstance.get<IGifRepository>(),
        ),
      )
      ..registerDependency<IGifRepository>(
        () => GifDs(
          Injector.appInstance.get<Dio>(),
        ),
      )
      ..registerSingleton<Dio>(
        () => DioClientFactory().getClient(),
      );
  }
}
