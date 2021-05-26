import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:trial_app/screens/welcome/welcome_screen.dart';
import 'package:trial_app/screens/welcome/welcome_1.dart';
import 'package:mongo_dart/mongo_dart.dart';

// var db = Db("mongodb://localhost:27017/");
// await db.open();

class DBConnection {

  static DBConnection _instance;

  final String _host = "localhost";
  final String _port = "27017";
  final String _dbName = "pls_bot";
  Db _db;

  static getInstance(){
    if(_instance == null) {
      _instance = DBConnection();
    }
    return _instance;
  }

  Future<Db> getConnection() async{
    if (_db == null){
      try {
        _db = Db(_getConnectionString());
        await _db.open();
      } catch(e){
        print(e);
      }
    }
    return _db;
  }

  _getConnectionString(){
    return "mongodb://$_host:$_port/$_dbName";
  }

  closeConnection() {
    _db.close();
  }

  postUserResponse() async{
    var coll=_db.collection("responses");
    var inserted_id=new ObjectId();
    await coll.insertAll([
      {'_id': inserted_id,
      'scenario': 'hardware',
      'qid': '1',
      'values':[33, 33, 33],
      }
    ]);
    return inserted_id;
  }
}