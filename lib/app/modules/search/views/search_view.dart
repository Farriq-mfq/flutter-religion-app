import 'package:alquranapp/app/layout/base_layout.dart';
import 'package:alquranapp/models/Surah.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 192, 136),
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: BaseLayout(
          size: size,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              TextField(
                onChanged: (value) async {
                  await controller.getSearch(value);
                },
                cursorColor: Color.fromARGB(255, 25, 192, 136),
                decoration: InputDecoration(
                  hintText: "Cari Qur'an",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 25, 192, 136), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 25, 192, 136), width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              controller.obx(
                onLoading: Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 25, 192, 136),
                  ),
                ),
                (state) => ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: state!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return listQuran(state[index]);
                  },
                ),
              ),
            ],
          )),
    );
  }

  Widget listQuran(Surah data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Get.toNamed("/detail-quran/${data.number}");
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.name!.transliteration!.id!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
        subtitle: Text(
          data.name!.translation!.id!,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        trailing: Text(
          "${data.revelation?.id.toString().split(".").last}",
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        leading: Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 25, 192, 136).withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "${data.numberOfVerses}",
            maxLines: 1,
            style: TextStyle(
                color: Color.fromARGB(255, 25, 192, 136),
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2),
          ),
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
