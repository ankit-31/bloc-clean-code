import 'package:bloccleancode/bloc/movies_bloc/movies_bloc.dart';
import 'package:bloccleancode/config/components/internet_exception.dart';
import 'package:bloccleancode/config/routes/routes_name.dart';
import 'package:bloccleancode/services/storage/local_storage.dart';
import 'package:bloccleancode/utils/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieBloc movieBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieBloc = MovieBloc();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    
    movieBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              LocalStorage lc = LocalStorage();
              lc.clearValue('token').then((value) {
                lc.clearValue('isLogin');
                Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
              });
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocProvider(
        create:
            (context) =>
                MovieBloc()..add(
                  MoviesFetched(),
                ), //here hitting api same as context.read.addevent
        child: Center(
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              switch (state.movielist.status) {
                case Status.loading:
                  return const Center(child: CircularProgressIndicator());
                case Status.error:
                  if(state.movielist.message=='No internet'){
                    return InternetExceptionWidget(callback: (){
                      movieBloc.add(MoviesFetched());
                    });
                  }
                  return Center(
                    child: Text(state.movielist.message.toString()),
                  );
                case Status.completed:
                  if (state.movielist.data == null) {
                    return Center(child: Text('No Data Found'));
                  }
                  final movieList = state.movielist.data!;
                  return ListView.builder(
                    itemBuilder: (_, index) {
                      final tvShow = movieList.tvShow[index];
                      return Card(
                        child: ListTile(
                          leading: Image(image: NetworkImage(tvShow.imageThumbnalilPath.toString())),
                          title: Text(tvShow.name.toString()),
                          subtitle: Text(tvShow.network.toString()),
                          trailing: Text(tvShow.status.toString()),
                        ),
                      );
                    },
                    itemCount: movieList.tvShow.length,
                  );
                default:
                  return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
