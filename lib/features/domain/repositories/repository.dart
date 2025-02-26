import 'package:dartz/dartz.dart';
import 'package:snapbite/features/data/models/responses/menu_list_response.dart';

import '../../../error/failures.dart';

abstract class Repository {
  Future<Either<Failure, MenuListResponse>> getMenuListAPI();
}
