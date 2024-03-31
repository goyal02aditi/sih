import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String? _selectedState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: DropdownButton<String>(
                      value: _selectedState,
                      items: <String>[
                        'Delhi',
                        'Gurugram',
                        'Noida',
                        'Mumbai',
                        'Indore',
                        'Goa',
                        'Alwar',
                        'Ajmer'
                      ] // Add your states here
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedState = newValue; // Update the selected state variable
                        });
                      },
                      hint: Text('Select State'),
                      underline: SizedBox(), // Remove underline
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Add spacing between dropdown and search icon
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Implement search functionality
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.black, // Line color
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hospitals.length,
              itemBuilder: (context, index) {
                return HospitalCard(hospital: hospitals[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}


class Hospital {
  final String name;
  final String address;
  final String phoneNumber;

  Hospital({
    required this.name,
    required this.address,
    required this.phoneNumber,
  });
}

final List<Hospital> hospitals = [
  Hospital(
    name: 'Max Hospital',
    address: 'Press Enclave Road, Saket',
    phoneNumber: '+123-456-7890',
  ),
  Hospital(
    name: 'Rashi Medical Hospital',
    address: 'Palam Road, Dabri',
    phoneNumber: '+987-654-3210',
  ),
  Hospital(
    name: 'PK Gupta Hospital',
    address: 'Old Anaz Mandi, Narela',
    phoneNumber: '+987-654-3210',
  ),
  Hospital(
    name: 'CK Birla Hospital',
    address: 'Extension Road, CP',
    phoneNumber: '+987-654-3210',
  ),
  
  // Add more hospitals as needed
];

class HospitalCard extends StatelessWidget {
  final Hospital hospital;

  HospitalCard({required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hospital image
            Container(
              width: 20.0,
              height: 30.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images.jpeg'), // Replace with actual image path
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            SizedBox(width: 20.0), // Add spacing between image and text
            // Hospital information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hospital.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0), // Add vertical spacing
                  Text(
                    hospital.address,
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0), // Add vertical spacing
                  Text(
                    hospital.phoneNumber,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
