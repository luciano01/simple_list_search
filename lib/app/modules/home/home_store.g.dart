// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<UserModel>?>? _$filterListComputed;

  @override
  List<UserModel>? get filterList => (_$filterListComputed ??=
          Computed<List<UserModel>?>(() => super.filterList,
              name: 'HomeStoreBase.filterList'))
      .value;

  final _$textToSearchAtom = Atom(name: 'HomeStoreBase.textToSearch');

  @override
  String? get textToSearch {
    _$textToSearchAtom.reportRead();
    return super.textToSearch;
  }

  @override
  set textToSearch(String? value) {
    _$textToSearchAtom.reportWrite(value, super.textToSearch, () {
      super.textToSearch = value;
    });
  }

  final _$listOfUsersAtom = Atom(name: 'HomeStoreBase.listOfUsers');

  @override
  ObservableFuture<List<UserModel>?> get listOfUsers {
    _$listOfUsersAtom.reportRead();
    return super.listOfUsers;
  }

  @override
  set listOfUsers(ObservableFuture<List<UserModel>?> value) {
    _$listOfUsersAtom.reportWrite(value, super.listOfUsers, () {
      super.listOfUsers = value;
    });
  }

  final _$getUsersAsyncAction = AsyncAction('HomeStoreBase.getUsers');

  @override
  Future getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic setTextToSearch(String? value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setTextToSearch');
    try {
      return super.setTextToSearch(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textToSearch: ${textToSearch},
listOfUsers: ${listOfUsers},
filterList: ${filterList}
    ''';
  }
}
