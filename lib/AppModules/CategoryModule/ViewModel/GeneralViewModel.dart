import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';

class GeneralViewModel extends GetxController {
  var sliderDataList = [].obs;
  onGetSliderData({sliderType}) async {
    var data = await ApiCall()
        .getRequest(ApisUtills().getSliderData + "${sliderType.toString()}");
    print("#######33 TYPE OF SLIDER IS ######");
    print(sliderType);

    sliderDataList.clear();
    print("Outside LOOP ############");
    print("Data is #############");
    print(data);
    for (int i = 0; i < data["data"].length; i++) {
      print("INSIDE LOOP ############");
      sliderDataList.add(data["data"][i]);
    }
    
      
    // print(sliderDataList);
    return sliderDataList;
  }
}
