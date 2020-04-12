import 'package:app/screens/location_detail/location_detail.dart';
import 'package:flutter/material.dart';
import '../../models/location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Color(0xFFF9EBEB),
      body: ListView(
        padding: EdgeInsets.only(bottom: 10.0),
        children: locations
            .map((location) => GestureDetector(
                  child: Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      margin: EdgeInsets.only(top: 10.0),
                      elevation: 2.0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.teal,
                                  Colors.amber,
                                ])),
                        padding: EdgeInsets.all(10.0),
                        height: 150.0,
                        child: Row(
                          children: <Widget>[
                            Card(
                              elevation: 20.0,
                              child: Image.asset(
                                location.imagePath,
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "This Place is very beautiful. Loren Ipsum dolor sit amet consectotur.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ]),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () => _onLocationTap(context, location.id),
                ))
            .toList(),
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationDetail(locationID)),
    );
  }
}
