import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simple_list_search/app/shared/models/movie_model.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple List Search - BLoC'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.textEditingController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Search'),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          controller.textEditingController.clear();
                          controller.searchMovieByName(
                            controller.textEditingController.text,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    controller.searchMovieByName(
                      controller.textEditingController.text,
                    );
                    debugPrint(controller.textEditingController.text);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<MovieModel>>(
              stream: controller.moviesStream,
              builder: (context, snapshot) {
                List<MovieModel>? data = snapshot.data;
                dynamic error = snapshot.error;

                if (error != null) {
                  return Text(error.toString());
                } else if (data == null) {
                  return Center(child: const CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      MovieModel movie = data[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(movie.title),
                        subtitle: Text(movie.releaseDate),
                      );
                    },
                  );
                }
                return Center(child: const CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
