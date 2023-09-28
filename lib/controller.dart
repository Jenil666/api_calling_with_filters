import 'dart:async';

import 'package:api_calling/modal.dart';
import 'package:get/get.dart';

import 'api_helper.dart';

class HomeCOntroller extends GetxController {
  Rx<TryData> data = TryData().obs;
  RxBool displayData = false.obs;
  RxBool displayProgressIndicator = true.obs;

  Future<void> getData() async {
    data.value = await ApiHelper.apiHelper.getApi();
    checkData();
  }

  void checkData()
  {
    displayProgressIndicator.value = true;
    displayData.value = false;
    bool check = true;
    check = true;
   try
   {
     data.value.data![0].productData;
   }
   catch (e)
    {
      check = false;
    }
    if(check == true)
      {
        displayData.value = true;
      }
    else
      {
        checkData();
      }
  }
  Future<void> filterBasedOnRating()
  async {
    displayProgressIndicator.value = false;
    displayData.value = false;
    data.value = await ApiHelper.apiHelper.getApi();
    data.value.data![0].productData!.sort((a, b) => double.parse(a.averageRating!).compareTo(double.parse(b.averageRating!)));
    displayData.value = true;
  }

  Future<void> filterBasedOnPrice()
  async {
    displayProgressIndicator.value = false;
    displayData.value = false;
    data.value = await ApiHelper.apiHelper.getApi();
    data.value.data![0].productData!.sort((a, b) => double.parse(a.minPrice!).compareTo(double.parse(b.minPrice!)));
    displayData.value = true;
  }

  Future<void> filterBasedOnName() async {
    displayProgressIndicator.value = false;
    displayData.value = false;
    data.value = await ApiHelper.apiHelper.getApi();
    data.value.data![0].productData!.sort((a, b){
      return a.userName!.toLowerCase().compareTo(b.userName!.toLowerCase());
    });
    displayData.value = true;
  }
}
