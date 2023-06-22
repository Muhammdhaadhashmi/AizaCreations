import 'package:aizacreationzz/AppModules/Utils/Networking/CallApi.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:get/get.dart';

class GetVideosViewModel extends GetxController {
  var videoList = [].obs;

  onGetVideosList() async {
    var data = await ApiCall().getRequest(ApisUtills().getVideoList);
    videoList.clear();
    for (int i = 0; i < data["data"].length; i++) {
      videoList.add(data["data"][i]);
    }
    return videoList;
  }
}
