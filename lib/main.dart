import 'package:final_project/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'view_models/posts_list_view_model.dart';


void main() {
  runApp(
    ChangeNotifierProvider<PostsListViewModel>(
      create: (context) => PostsListViewModel()..fetchPosts(),
      child:const GetMaterialApp(

        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    ),
  );
}
