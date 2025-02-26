import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:meta/meta.dart';
import 'package:snapbite/features/data/datasources/shared_preference.dart';
import 'package:snapbite/features/domain/repositories/repository.dart';
import 'package:snapbite/utils/device_info.dart';

import '../../../../error/failures.dart';
import '../../../../error/messages.dart';
import '../../../data/models/common/common_error_response.dart';
import '../../../data/models/responses/menu_list_response.dart';
import '../base_bloc.dart';
import '../base_event.dart';
import '../base_state.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Base<MenuEvent, BaseState<MenuState>> {
  final AppSharedData appSharedData;
  final Repository repository;
  final DeviceInfo deviceInfo;

  MenuBloc({
    required this.appSharedData,
    required this.repository,
    required this.deviceInfo,
  }) : super(MenuInitial()) {
    on<GetMenuListEvent>(_getMenuList);
  }

  Future<void> _getMenuList(
      GetMenuListEvent event, Emitter<BaseState<MenuState>> emit) async {
    emit(APILoadingState());
    final result = await repository.getMenuListAPI();
    emit(result.fold((l) {
      if (l is ServerFailure) {
        return APIFailureState(errorResponseModel: l.errorResponse);
      } else if (l is AuthorizedFailure) {
        return AuthorizedFailureState(errorResponseModel: l.errorResponse);
      } else if (l is ConnectionFailure) {
        return APIFailureState(
            errorResponseModel: ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''));
      } else if (l is ForceUpdateFailure) {
        return ForceUpdateState(errorResponseModel: l.errorResponse);
      } else if (l is MaintenanceFailure) {
        return MaintenanceState(errorResponseModel: l.errorResponse);
      } else {
        return APIFailureState(
            errorResponseModel: ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''));
      }
    }, (r) {
      if (r.status) {
        return GetMenuListSuccessState(menuResult: r.result);
      } else {
        return APIFailureState(
            errorResponseModel: ErrorResponseModel(
                responseError: ErrorMessages.ERROR_SOMETHING_WENT_WRONG,
                responseCode: ''));
      }
    }));
  }
}
