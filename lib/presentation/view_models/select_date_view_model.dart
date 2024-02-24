import 'package:flutter/cupertino.dart';

import '../../domain/models/models.dart';

class SelectDateViewModel extends ChangeNotifier{
  int _selectedIndex = -1;
  int _selectedSeatIndex = 0;
  final List<String> _dates = [
    "6 Mar",
    "7 Mar",
    "8 Mar",
    "9 Mar",
    "10 Mar",
    "11 Mar",
    "12 Mar",
  ];
  
  final List<SeatModel>seatModelList = [
    SeatModel(time: "12:30", theatre: "Cinetech + hall", fromprice: 50, bonusprice: 2500),
    SeatModel(time: "09:30", theatre: "Pvr + hall", fromprice: 80, bonusprice: 2500),
    SeatModel(time: "07:30", theatre: "Ambadi + hall", fromprice: 80, bonusprice: 2500),
    SeatModel(time: "11:30", theatre: "Chithra + hall", fromprice: 50, bonusprice: 2500),
  ];
  int get selectedIndex => _selectedIndex;
  int get selectedSeatIndex => _selectedSeatIndex;

  List<String> get dates => _dates;

  void dateSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void seatSelectedIndex(int index) {
    _selectedSeatIndex = index;
    notifyListeners();
  }

}