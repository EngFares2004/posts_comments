import 'package:final_project/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);
    goToNextView();

  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: const Color(0xffe5e8ee),
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

        Align(
          alignment: Alignment.bottomCenter,
          child: FadeTransition(
          opacity: fadingAnimation!,

                 child: const Text(
                  'Posts App ',
                  style:  TextStyle(
                    fontSize: 51,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                 textAlign:TextAlign.center,
                 )  )),

            Container(
                height: MediaQuery.of(context).size.height/1.8,

                margin: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: ClipRRect(

                    child: Image.asset("assets/download.jpeg"
                      , fit: BoxFit.fill,)
                )
            ),


          ],
      ),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(()=> const MainView(),transition: Transition.fade);
    });

  }

}


