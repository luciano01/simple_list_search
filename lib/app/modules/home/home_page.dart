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

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Search List'),
      ),
      body: Observer(builder: (_) {
        List<UserModel>? listOfUsers = store.filterList;
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

        return ListView(
          children: [
            _searchField(
              onChanged: store.setTextToSearch,
            ),
            ListView.builder(
              itemCount: listOfUsers.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                UserModel? user = listOfUsers[index];
                return ListTile(
                  title: Text('${user.name!.first!} ${user.name!.last!}'),
                  subtitle: Text(user.email!),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}

Widget _searchField({
  void Function(String)? onChanged,
}) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        hintText: 'Search user',
      ),
      onChanged: onChanged,
    ),
  );
}
