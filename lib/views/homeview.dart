
import 'package:fireflutter/views/create_post_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FireFlutter App"),
        centerTitle: true,
      ),
      body: ListView.separated(itemBuilder: 
      (context,index){
        return const Card();
      },
      separatorBuilder: (context, index){ return const Divider();}, 
      itemCount: 10
      ),

      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePostView()));
      }, 
      label: const Text("ADD"),
      icon: const Icon(Icons.add),
      ),
    );
  }
}