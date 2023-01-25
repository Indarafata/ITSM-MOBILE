// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:itsm_mobile/model/computer_model.dart';
import 'package:itsm_mobile/modules/computers/views/detail.dart';
import 'package:itsm_mobile/modules/home_page/views/home_page.dart';
import 'package:itsm_mobile/service/computer_service.dart';

class Computer extends StatefulWidget {
  const Computer({Key? key}) : super(key: key);

  @override
  State<Computer> createState() => _Computer();
}

class _Computer extends State<Computer> {
  Color colorPrimary = Color(0xFF79DAE8);
  FontWeight medium = FontWeight.w500;
  FontWeight semiBold = FontWeight.w600;
  FontWeight bold = FontWeight.w700;
// Border Radius
  double defaultBorderRadius = 15.0;
  // Font
  TextStyle fontNunito = const TextStyle(fontFamily: 'Nunito');

  var computer = ComputerService();

  int angka = 0;

  late Future<List<ComputerModel>> _computer;
  @override
  void initState() {
    super.initState();
    try {
      _computer = computer.getAllComputer();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (HomePage())));
            },
            icon: Icon(
              IconlyLight.arrow_left,
              color: Colors.black,
            )),
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        // bottomOpacity: 0.0,
        elevation: 0.0,
        title: const Text(
          "Computer",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: _computer,
            builder: (context, AsyncSnapshot<List<ComputerModel>> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        // var event = snapshot.data?.data.first;
                        // var computer = snapshot.data!.toList();
                        var computer = snapshot.data![index];
                        angka++;
                        // String ? ngok;

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, DetailPage.url,
                                arguments: computer!);
                          },
                          // child: Text(computer.name.toString())
                          child: ListComputer(computer!),
                        );
                      },
                      // itemCount: 3,
                      itemCount: snapshot.data!.length,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else {
                  return const Text('empty');
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget ListComputer(ComputerModel view) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: 316,
        decoration: BoxDecoration(
          color: colorPrimary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(defaultBorderRadius),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                // flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      view.name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: semiBold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      view.dateMod.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: fontNunito.copyWith(
                        color: colorPrimary,
                        fontWeight: medium,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // Flexible(
              // child:
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF79DAE8),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Detail",
                    overflow: TextOverflow.ellipsis,
                    style: fontNunito.copyWith(
                      color: Colors.white,
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              // )
            ],
          ),
        ),
      ),
    );
  }
}
