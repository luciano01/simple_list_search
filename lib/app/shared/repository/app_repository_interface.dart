import 'package:simple_list_search/app/shared/models/user_model.dart';

abstract class IAppRepository {
  Future<List<UserModel>?> getUsers();
}
