// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
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

  @override
  String toString() {
    return '''
listOfUsers: ${listOfUsers}
    ''';
  }
}
