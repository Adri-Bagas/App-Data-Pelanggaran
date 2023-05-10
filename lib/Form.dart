import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class Forminput extends StatefulWidget {
  const Forminput({super.key});

  @override
  State<Forminput> createState() => _FormState();
}

class _FormState extends State<Forminput> {
  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image.
  final XFile? imagePicked = await _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            // Navigator.pop(context);
          },
          child: Container(
            child: Icon(
              Icons.close,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: double.infinity,
              child: Text(
                'Kelas',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 62,
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Kelas',
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: double.infinity,
              child: Text(
                'Nama Siswa',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 62,
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Nama Siswa',
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: double.infinity,
              child: Text(
                'Keterangan',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 62,
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Keterangan',
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: double.infinity,
              child: Text(
                'Gambar',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 62,
              margin: EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Gambar',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    contentPadding: EdgeInsets.only(top: 30, left: 15)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 40),
              width: double.infinity,
              child: Text(
                'Select Point',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 30,
              margin: EdgeInsets.only(left: 40, right: 150),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Select Point',
                    hintStyle: TextStyle(
                      fontSize: 12,
                    ),
                    contentPadding: EdgeInsets.only(top: 30, left: 15)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 200),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Submit',
                  )),
            )
          ],
        ),
      ),
    );
  }
}
