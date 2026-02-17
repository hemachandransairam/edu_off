import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DataService {
  static Box get _box => Hive.box('studentBox');

  // New: Batch sync function
  static Future<void> syncOfflineData() async {
    final allLocalData = _box.values.toList();

    if (allLocalData.isNotEmpty) {
      try {
        // Convert Hive objects to a list of Maps for Supabase
        List<Map<String, dynamic>> dataToSync =
            allLocalData
                .map((item) => Map<String, dynamic>.from(item))
                .toList();

        await Supabase.instance.client.from('students').upsert(dataToSync);

        debugPrint(
          "Successfully synced ${dataToSync.length} records to Supabase.",
        );
      } catch (e) {
        debugPrint("Auto-sync failed: $e");
      }
    }
  }

  // Updated: Save with email as the key for easy identification
  static Future<void> saveStudentData(Map<String, dynamic> data) async {
    await _box.put(data['email'], data); // Save to Hive immediately

    var connectivity = await (Connectivity().checkConnectivity());
    if (!connectivity.contains(ConnectivityResult.none)) {
      try {
        await Supabase.instance.client.from('students').upsert(data);
      } catch (e) {
        debugPrint("Immediate sync failed, data remains in Hive.");
      }
    }
  }
}
