import 'package:api_getx/controllers/data_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailListScreen extends StatelessWidget {
  UserDetailListScreen({Key? key}) : super(key: key);
  final controller = Get.put(DataController());
  Future init() async {
    await controller.getUserInformationFromApi();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemBuilder: (ctx, i) {
                    String picture;
                    String title;
                    String subtitle;
                    try {
                      picture = controller.userList!.data![i].picture!;
                    } catch (e) {
                      picture = '';
                    }
                    try {
                      title = controller.userList!.data![i].title!;
                    } catch (e) {
                      title = '';
                    }
                    try {
                      subtitle = controller.userList!.data![i].id!;
                    } catch (e) {
                      subtitle = '';
                    }

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20.0,
                        child: Image.network(picture),
                      ),
                      title: Text(title),
                      subtitle: Text(subtitle),
                    );
                  },
                  itemCount: controller.userList!.data!.length,
                ),
        ),
      ),
    );
  }
}
