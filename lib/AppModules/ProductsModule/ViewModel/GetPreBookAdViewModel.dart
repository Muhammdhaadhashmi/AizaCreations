import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';

class GetPreBookAdViewModel extends GetxController {
  var preBookAdList = [].obs;

  onGetPreBookAdList() async {
    var data = await ApiCall().getRequest(ApisUtills().getPreBookAd);
    print(data);
    preBookAdList.clear();
    for (int i = 0; i < data["data"].length; i++) {
      preBookAdList.add(data["data"][i]);
    }
    return preBookAdList;
  }
}
