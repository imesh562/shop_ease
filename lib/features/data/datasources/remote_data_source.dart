import 'dart:core';

import 'package:snapbite/core/network/api_helper.dart';
import 'package:snapbite/core/network/mock_api_helper.dart';
import 'package:snapbite/features/data/datasources/shared_preference.dart';
import 'package:snapbite/features/data/models/responses/menu_list_response.dart';

abstract class RemoteDataSource {
  Future<MenuListResponse> getMenuListAPI();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final APIHelper apiHelper;
  final MockAPIHelper mockAPIHelper;
  final AppSharedData appSharedData;

  RemoteDataSourceImpl({
    required this.apiHelper,
    required this.appSharedData,
    required this.mockAPIHelper,
  });

  @override
  Future<MenuListResponse> getMenuListAPI() async {
    try {
      final response = await mockAPIHelper.post(
        "menu-service/menu-list",
        body: null,
      );
      return MenuListResponse.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
