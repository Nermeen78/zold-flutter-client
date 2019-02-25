import 'package:flutter/material.dart';
import './home_page.dart';
import '../backend/API.dart';

abstract class HomePageViewModel extends State<HomePage> {
  String idText = "ID";
  String balanceText = "Balance";
  API api = API();

  HomePageViewModel() {
    pullWallet();
    getId();
    getBalance();
  }

  void showMessageDialog(String message) {}

  @override
  void dispose() {
    super.dispose();
  }

  void getId() {
    api.getId()
    .then((id){
      setState(() {
        idText = id;
      });
    })
    .catchError((ex){
      showMessageDialog("Error: " + ex.toString());
      setState(() {
        idText = "ID: error";
      });
    });
  }

  void getBalance() {
    api.getBalance()
    .then((balance){
      debugPrint(balance);
      setState(() {
        balanceText = balance;
      });
    })
    .catchError((ex){
      showMessageDialog("Error: " + ex.toString());
      setState(() {
        balanceText = "Balance: error";
      });
    });
  }

  void refresh() {
    pullWallet();
    getId();
    getBalance();
  }

  void pullWallet() {
    api.pull()
    .then((response){
      debugPrint(response);
    })
    .catchError((ex){
    });
  }
}