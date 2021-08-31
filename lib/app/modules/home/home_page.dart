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
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isSearching
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
              )
            : null,
        title: isSearching ? _textFormField() : Text('Simple Search List'),
        actions: [
          isSearching
              ? IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                ),
        ],
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

Widget _textFormField() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: 'Search user',
    ),
  );
}
