import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_list_search/app/modules/home/home_store.dart';
import 'package:simple_list_search/app/shared/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Search List'),
      ),
      body: Observer(builder: (_) {
        List<UserModel>? listOfUsers = store.listOfUsers.value;
        var error = store.listOfUsers.error;

        if (listOfUsers == null || listOfUsers.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (error != null) {
          return Center(
            child: Text('Oops! Somethins wrong!'),
          );
        }

        return ListView.builder(
          itemCount: listOfUsers.length,
          itemBuilder: (context, index) {
            UserModel? user = listOfUsers[index];
            return ListTile(
              title: Text('${user.name!.first!} ${user.name!.last!}'),
              subtitle: Text(user.email!),
            );
          },
        );
      }),
    );
  }
}
