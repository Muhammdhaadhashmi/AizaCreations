import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';

class GetPreBookByIdViewModel extends GetxController {
  var preBookByIdList = [].obs;
  onGetPreBookById({prebookId}) async {
    var data = await ApiCall()
        .getRequest(ApisUtills().preBookById + "${prebookId.toString()}");
    print("#######33 TYPE OF SLIDER IS ######");
    print(prebookId);
    print("Data is #############");

    preBookByIdList.clear();
    print("Outside LOOP ############");

    for (int i = 0; i < data["data"].length; i++) {
      print("INSIDE LOOP ############");
      preBookByIdList.add(data["data"][i]);
    }
    print(preBookByIdList);
    return preBookByIdList;
  }
}
