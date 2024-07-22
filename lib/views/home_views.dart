import 'package:cache_api_data_flutter/bloc/news_bloc.dart';
import 'package:cache_api_data_flutter/bloc/news_events.dart';
import 'package:cache_api_data_flutter/bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../main.dart';
import '../utils/enum.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  late NewsBloc _newsBloc;
  @override
  void initState() {
    _newsBloc = NewsBloc(newsRepository: getIt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News API'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider(
        create: (context) => _newsBloc..add(FetchHackerNews()),
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            switch (state.newsList.status) {
              case Status.loading:
                return const Center(child: CircularProgressIndicator());

              case Status.error:
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 50,
                        ),
                        Text(state.newsList.message.toString())
                      ],
                    ),
                  ),
                );
              case Status.success:
                if (state.newsList.data == null) {
                  return const Center(child: Text('No Data Found'));
                }
                final newsList = state.newsList.data!.hits;
                return ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(newsList[index].title),
                        subtitle: Text(newsList[index].author),
                        trailing: Text(newsList[index].id.toString()),
                      ),
                    );
                  },
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
