import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/remote/network/api_manager.dart';
import 'package:news_app/models/sources/source.dart';

class ArticlesViewModel extends Cubit<ArticlesStates> {
  ArticlesViewModel() : super(LoadingState());
  getSources(String categoryId) async {
    try {
      emit(LoadingState());
      var response = await ApiManager.getSources(categoryId);
      if (response.status == 'error') {
        // logic of server error
        emit(ErrorState(response.message ?? ''));
      } else {
        // logic of success source list
        emit(SuccessState(response.sources??[]));
      }
    } catch (e) {
      //logic of connection error
      emit(ErrorState('No Internet Connection'));
    }
  }
}

sealed class ArticlesStates {}

class LoadingState extends ArticlesStates {}

class SuccessState extends ArticlesStates {
  List<Source> sourceList;
  SuccessState(this.sourceList);
}

class ErrorState extends ArticlesStates {
  String errorMassage;
  ErrorState(this.errorMassage);
}
