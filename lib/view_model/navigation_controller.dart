import 'package:get/get.dart';

class NavController extends GetxController{
  int currentPage=0;

  changePage(int index){
    currentPage=index;
    update();
  }


}