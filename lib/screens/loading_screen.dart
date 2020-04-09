import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    print('build Called');
    
    String myMargin = 'abc';
    double myMarginAsDouble;
    
    try{
      myMarginAsDouble = double.parse(myMargin);
    }catch(exception){
      print(exception);
    }
    
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsDouble ?? 30.0),
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

  void getLocation () async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  void initState() {
    super.initState();
    print('initState Called');
    getLocation();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate Called');
  }


}