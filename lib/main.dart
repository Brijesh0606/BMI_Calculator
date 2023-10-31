import 'package:bmi_calculator/BMIScore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  TextEditingController ageController = TextEditingController(text: '0');
  TextEditingController weightController = TextEditingController(text: '0');
  TextEditingController feetController = TextEditingController(text: '0');
  TextEditingController inchController = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
  }

  void toggleMaleSelection() {
    setState(() {
      if (isFemaleSelected) {
        isFemaleSelected = !isFemaleSelected;
      }
      if (isMaleSelected) {
        return;
      }
      isMaleSelected = !isMaleSelected;
    });
  }

  void toggleFemaleSelection() {
    setState(() {
      if (isMaleSelected) {
        isMaleSelected = !isMaleSelected;
      }
      if (isFemaleSelected) {
        return;
      }
      isFemaleSelected = !isFemaleSelected;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BMI Calculator",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  Expanded(
                    child: SizedBox(
                      height: 180,
                      child: ElevatedButton(
                        onPressed: toggleMaleSelection,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // Adjust border radius for rectangular shape
                            ),
                          ),
                          side: MaterialStateProperty.resolveWith(
                                (states) {
                              if (!isMaleSelected) {
                                return const BorderSide(color: Colors.red, width: 2.0);
                              } else {
                                return const BorderSide(color: Colors.blue, width: 2.0);
                              }
                            },
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/male_icon.png', // Use the path to your local image
                              width: 120, // Adjust the width as needed
                              height: 120, // Adjust the height as needed
                            ),
                            const SizedBox(width: 10), // Adjust the spacing as needed
                            const Text("Male", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: SizedBox(
                      height: 180,
                      child: ElevatedButton(
                        onPressed: toggleFemaleSelection,
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), // Adjust border radius for rectangular shape
                            ),
                          ),
                          side: MaterialStateProperty.resolveWith(
                                (states) {
                              if (!isFemaleSelected) {
                                return const BorderSide(color: Colors.red, width: 2.0);
                              } else {
                                return const BorderSide(color: Colors.blue, width: 2.0);
                              }
                            },
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/female_icon.png', // Use the path to your local image
                              width: 120, // Adjust the width as needed
                              height: 120, // Adjust the height as needed
                            ),
                            const SizedBox(width: 10), // Adjust the spacing as needed
                            const Text("Female", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 2.0,          // Border width
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/age_icon.png', // Use the path to your local image
                                  width: 50, // Adjust the width as needed
                                  height: 50, // Adjust the height as needed
                                ),
                              ),
                              const Text("Age", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        ageController.text = decreaseValue(ageController.text).toString();
                                      },
                                      icon: Image.asset(
                                        'assets/minus.png', // Use the path to your local image
                                        width: 24, // Adjust the width as needed
                                        height: 24, // Adjust the height as needed
                                      ),
                                    ),
                                    // const SizedBox(width: 15,),
                                    SizedBox(
                                      width: 50,
                                      height: 40,
                                      child: TextField(
                                        controller: ageController,
                                        keyboardType: TextInputType.number, // Set input type to numeric
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),// You can customize the border style
                                        ),
                                      ),
                                    ),
                                    // const SizedBox(width: 15,),
                                    IconButton(
                                      onPressed: () {
                                        ageController.text = increaseValue(ageController.text).toString();
                                      },
                                      icon: Image.asset(
                                        'assets/plus.png', // Use the path to your local image
                                        width: 24, // Adjust the width as needed
                                        height: 24, // Adjust the height as needed
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 2.0,          // Border width
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/weight.png', // Use the path to your local image
                                  width: 50, // Adjust the width as needed
                                  height: 50, // Adjust the height as needed
                                ),
                              ),
                              const Text("Weight", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold),),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        weightController.text = decreaseValue(weightController.text).toString();
                                      },
                                      icon: Image.asset(
                                        'assets/minus.png', // Use the path to your local image
                                        width: 24, // Adjust the width as needed
                                        height: 24, // Adjust the height as needed
                                      ),
                                    ),
                                    // const SizedBox(width: 15,),
                                    SizedBox(
                                      width: 50,
                                      height: 40,
                                      child: TextField(
                                        controller: weightController,
                                        keyboardType: TextInputType.number, // Set input type to numeric
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),// You can customize the border style
                                        ),
                                      ),
                                    ),
                                    // const SizedBox(width: 15,),
                                    IconButton(
                                      onPressed: () {
                                        weightController.text = increaseValue(weightController.text).toString();
                                      },
                                      icon: Image.asset(
                                        'assets/plus.png', // Use the path to your local image
                                        width: 24, // Adjust the width as needed
                                        height: 24, // Adjust the height as needed
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 2.0,          // Border width
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Height", style: TextStyle(color: Colors.deepPurple, fontSize: 16, fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const Text("Feet", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.bold),),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    width: 70,
                                    height: 40,
                                    child: TextField(
                                      controller: feetController,
                                      keyboardType: TextInputType.number, // Set input type to numeric
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),// You can customize the border style
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text("Inch", style: TextStyle(color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.bold),),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    width: 70,
                                    height: 40,
                                    child: TextField(
                                      controller: inchController,
                                      keyboardType: TextInputType.number, // Set input type to numeric
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),// You can customize the border style
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 20,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Button click action
                        if(validateInput(context)) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BMIScore(age: int.parse(ageController.text), weight: int.parse(weightController.text), feet: int.parse(feetController.text), inch: int.parse(inchController.text), isMale: isMaleSelected, isFemale: isFemaleSelected,)),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple, // Button background color
                      ),
                      child: const Text("Calculate BMI", style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  const SizedBox(width: 20,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  int increaseValue(String text) {
    int currentValue = int.parse(text);
    currentValue++;
    return currentValue;
  }

  int decreaseValue(String text) {
    int currentValue = int.parse(text);
    currentValue--;
    return currentValue;
  }

  bool validateInput(BuildContext context) {

    if(isMaleSelected == false && isFemaleSelected == false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Select Gender"),
        // margin: EdgeInsets.only(bottom: 8),
      ));
      return false;
    }

    if(ageController.text.isEmpty || ageController.text == "0") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Age"),
        // margin: EdgeInsets.only(bottom: 8),
      ));
      return false;
    }

    if(weightController.text.isEmpty || weightController.text == "0") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Weight"),
        // margin: EdgeInsets.only(bottom: 8),
      ));
      return false;
    }

    if(feetController.text.isEmpty || feetController.text == "0") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enter Feet"),
        // margin: EdgeInsets.only(bottom: 8),
      ));
      return false;
    }

    return true;
  }
}