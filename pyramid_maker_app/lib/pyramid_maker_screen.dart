import 'package:flutter/material.dart';


class PyramidScreen extends StatefulWidget {
  @override
  _PyramidScreenState createState() => _PyramidScreenState();
}

class _PyramidScreenState extends State<PyramidScreen> {

  //create Textfield Controller
  final TextEditingController _controller = TextEditingController();

  //store pyramid , create list
  List<String> pyramid = [];

  // Function to generate the pyramid
  void generatePyramid(int n) {
    int current = 1;  //counter jo number ko track kry ga
    List<String> temp = []; //temperory list jis m rows store hun gyi
    for (int i = 1; i <= n; i++) {  //outer loop ,i 1 sy n tak run ho ga
      String row = ''; //empty string store the row
      for (int j = 0; j < i; j++) { //inner loop j sy i tak run
        row += '$current '; //current number add in row
        current++; //increment
      }
      temp.add(row.trim()); //trim the row add temperory list
    }
    setState(() { //update the screen
      pyramid = temp; //pyramid list ko temperary list sy add krna
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Number Pyramid'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input TextField
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter the value of N',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          const SizedBox(height: 20),

            // Generate Button
            ElevatedButton(
              onPressed: () {
                final input = int.tryParse(_controller.text); //input ko parse krna
                if (input != null && input > 0) {
                  generatePyramid(input);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar( //error msg display
                  const SnackBar(content: Text('Please enter a valid positive integer!')),
                  );
                }
              },
              child: const Text('Generate Pyramid',style: TextStyle(fontSize: 20),),
            ),
          const SizedBox(height: 20),
            // Display Pyramid in a ListView
            ListView.builder(
              shrinkWrap: true,
              itemCount: pyramid.length,
              itemBuilder: (context, index) {
                return Text(
                  pyramid[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}