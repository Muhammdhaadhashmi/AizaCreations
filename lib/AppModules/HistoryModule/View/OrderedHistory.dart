import 'package:aizacreationzz/AppModules/HistoryModule/View/HistoryTile.dart';
import 'package:aizacreationzz/AppModules/HistoryModule/ViiewModel/HistroyViewModel.dart';
import 'package:aizacreationzz/AppModules/Utils/AppBar.dart';
import 'package:aizacreationzz/AppModules/Utils/AppSizeConfig.dart';
import 'package:aizacreationzz/AppModules/Utils/SpinkitView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderedHistory extends StatefulWidget {
  String saleID;

  OrderedHistory({required this.saleID});

  @override
  _OrderedHistoryState createState() => _OrderedHistoryState();
}

class _OrderedHistoryState extends State<OrderedHistory> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final controller = Get.put(HistoryViewModel());

  Future? fetchAndSetFuture;

  @override
  void initState() {
    super.initState();

    fetchAndSetFuture = controller.onGetOrderDetail(saleId: widget.saleID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            customAppBar(
                onSearch: (value) {},
                context: context,
                text: "Orders Detail",
                isDrawer: false,
                isSearch: false,
                scaffoldKey: scaffoldKey),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                    height: AppConfig(context: context).height,
                    // color: Colors.purple,
                    child: FutureBuilder(
                        future: fetchAndSetFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: SpinKitView(themeIsDark: false),
                              ),
                            );
                          if (controller.singleOrderList.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("No Orders detail"),
                              ),
                            );
                          }

                          return ListView.builder(
                            itemCount: controller.singleOrderList.length,
                            itemBuilder: (context, index) {
                              return historyTile(
                                  context: context,
                                  index: 0,
                                  modelData: controller.singleOrderList[index]);
                            },
                          );
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
