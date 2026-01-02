import 'package:flutter/material.dart';
class MyAddressPage extends StatefulWidget{
  @override
  State<MyAddressPage> createState() => _MyProfilePage();
}
class _MyProfilePage extends State<MyAddressPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 40,width: 40,
                    decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle,border: Border.all(width: 0.5,color: Colors.grey)),

                    child: IconButton(onPressed: (){},icon:const Icon(Icons.arrow_back_ios_new,size: 20,)),
                  ),
                ),
                const Text('Add Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(28, 28, 28, 0.1).withOpacity(0.1), // Shadow color
                      spreadRadius: 0, // Spread radius
                      blurRadius: 20, // Blur radius
                      offset: Offset(0, 2), // Offset
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text(
                        'Address',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Please fill the address details below',
                        style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          Text('Address', style: TextStyle(color: Colors.grey)),
                          Spacer(),
                          Icon(Icons.location_searching_rounded, color: Colors.pink),
                          Text(
                            'Use Current Location',
                            style: TextStyle(
                              color: Colors.pink,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.pink),
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('City', style: TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_city, color: Colors.pink),
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('State', style: TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_city, color: Colors.pink),
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Zip Code', style: TextStyle(color: Colors.grey)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.zoom_in, color: Colors.pink),
                          labelStyle: const TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Default Address', style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80,),
            TextButton(onPressed: (){},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ), child: const Text('Add New Address',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}