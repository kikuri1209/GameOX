import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'Model/Item.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<Item>? _itemList;
  String? _error;

  void getTodos() async {
    try {
      setState(() {
        _error = null;
      });


      final response =
      await _dio.get('http://localhost:3000/products');
      debugPrint(response.data.toString());
      // parse
      List list = jsonDecode(response.data.toString());
      setState(() {
        _itemList = list.map((item) => Item.fromJson(item)).toList();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('เกิดข้อผิดพลาด: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(

        title: Center(child: Text("ความคิดเห็น")),
      ),
      body: Expanded(
        child: ListView.builder(
            itemCount: _itemList!.length,
            itemBuilder: (context, index) {
              var Item = _itemList![index];
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(Item.name,style: TextStyle(
                            fontSize: 30,
                          ),),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(Item.com,style:TextStyle(
                            fontSize: 20,
                          ),),
                        )
                      ],
                    ),

                  ],
                ),
              );
            }
        ),
      ),

    );
  }
}