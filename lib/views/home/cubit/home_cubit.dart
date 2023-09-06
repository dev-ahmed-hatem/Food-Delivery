import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iti_project/dio/api_url.dart';
import 'package:iti_project/dio/dio_helper.dart';
import 'package:iti_project/views/home/models/BannerModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  DioHelper _dioHelper = DioHelper();

  BannerModel bannerModel = BannerModel();

  void getBanners() async {
    emit(HomeBannerLoading());
    try {
      final response = await _dioHelper.getData(
        path: ApiUrl.banners,
      );
      bannerModel = BannerModel.fromJson(response.data);
      if (bannerModel.status == true) {
        emit(HomeBannerSuccess());
      } else {
        Get.snackbar("Error", bannerModel.message ?? "",
            backgroundColor: Colors.red);
        emit(HomeBannerError());
      }
    } catch (e) {
      emit(HomeBannerError());
    }
  }
}
