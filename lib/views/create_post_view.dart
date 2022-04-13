import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostView extends StatelessWidget {
  CreatePostView({ Key? key }) : super(key: key);

  // ignore: unnecessary_new
  final  ValueNotifier<File?> valueNotifier = new ValueNotifier<File?>(null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AddPost"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ValueListenableBuilder<File?>(
            valueListenable: valueNotifier,
            builder: (context,image,child) {
              return image != null ? 
              InkWell(
                onTap: ()async {
                  final xfile = await ImagePicker().pickImage(source:ImageSource.gallery);
                  if(xfile != null){
                    valueNotifier.value = File(xfile.path);
                  }
                },
                child: Image.asset(
                  "assets/p.png",
                  height: 200,
                  fit: BoxFit.cover,
                  ),
              )
              : Image.file(
                image!,
                height: 200,
                fit: BoxFit.cover,
                );
            }
          ),

          const SizedBox(height:15),
          TextFormField(
            decoration: InputDecoration(
              label: const Text("write something"),
            ),
          ),
          TextButton(onPressed: (){},
           child: const Text("Add Post",
           style: TextStyle(color: Colors.white),
           ),

           )
        ]
      ),
    );
  }
}