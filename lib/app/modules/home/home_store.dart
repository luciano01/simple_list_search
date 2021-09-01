import 'package:mobx/mobx.dart';
import 'package:simple_list_search/app/shared/models/user_model.dart';
import 'package:simple_list_search/app/shared/repository/app_repository_interface.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IAppRepository _repository;

  HomeStoreBase(this._repository) {
    getUsers();
  }

  @observable
  String? textToSearch;

  @action
  setTextToSearch(String? value) => textToSearch = value;

  @computed
  List<UserModel>? get filterList {
    if (textToSearch == null) {
      return listOfUsers.value;
    } else {
      return listOfUsers.value!
          .where((value) => value.name!.first!
              .toLowerCase()
              .contains(textToSearch!.toLowerCase()))
          .toList();
    }
  }

  @observable
  ObservableFuture<List<UserModel>?> listOfUsers = ObservableFuture.value([]);

  @action
  getUsers() async {
    listOfUsers = _repository.getUsers().asObservable();
  }
}
