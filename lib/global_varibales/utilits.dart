import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

Future<List<File>> imagePicker() async {

  List<File> images=[];
  try {

    var files=await FilePicker.platform.pickFiles(allowMultiple: true,type: FileType.image);

    if(files !=null && files.files.isNotEmpty)
      {
        for(int i=0;i<files.files.length;i++)
          {
            images.add(File(files.files[i].path!));
          }
      }


  } catch (e) {
    print(e.toString());
  }

  return images;
}


customAlertDialog(String title,String content,String ok,String cancel, CallBack(),BuildContext context,Color color)
{
  return AlertDialog(


      title: const Center(child: Text('Delete Product?')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Do you want to delete this product?'),
          const SizedBox(height: 22,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 120,
                  height: 50,
                  child: Text('Cancel',style: TextStyle(
                      fontSize: 18,
                      color: color
                  ),),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.8,
                          color: color
                      )
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              InkWell(
                onTap: CallBack,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  width: 120,
                  height: 50,
                  child: const Text('Delete',style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),
                  decoration: BoxDecoration(
                      color: color
                  ),
                ),
              ),
            ],
          )

        ],
      )

  );
}
