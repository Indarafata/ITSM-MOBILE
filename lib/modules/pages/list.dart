import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';

class List extends StatelessWidget {
  const List({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'home');
            },
            icon: Icon(IconlyLight.arrow_left)),
        title: Text(
          'ITSM Mobile',
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blue, Colors.green])),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlueAccent,
            ),
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                FieldDetail('Name',
                    'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj'),
                FieldDetail('Status', ''),
                FieldDetail('Model', ''),
                FieldDetail('Last inventory', ''),
                FieldDetail('Networking - IP', ''),
                FieldDetail('Serial Number', ''),
                FieldDetail('Alternative Username', ''),
                FieldDetail('Type', ''),
                FieldDetail('OS - name', ''),
                FieldDetail('OS - version', ''),
                Container(
                  margin: EdgeInsets.fromLTRB(250, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'History',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 75,
                  child: const Center(
                      child: Text(
                    'ID',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.blue),
                  )),
                ),
                Container(
                  width: 75,
                  child: const Center(
                      child: Text(
                    'Date',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.blue),
                  )),
                ),
                Container(
                  width: 75,
                  child: const Center(
                      child: Text(
                    'User',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.blue),
                  )),
                ),
                Container(
                  width: 75,
                  child: const Center(
                      child: Text(
                    'Field',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.blue),
                  )),
                ),
                Container(
                  width: 75,
                  child: const Center(
                      child: Text(
                    'Update',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.blue),
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container FieldDetail(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(label),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            child: Flexible(
              child: Text(
                value,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
