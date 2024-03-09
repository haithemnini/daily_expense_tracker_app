import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../db_hive_client.dart';
import 'package:path_provider/path_provider.dart';

class DbHiveClient implements DbHiveClientBase {
  @override
  Future<bool> initDb<T>({
    required String boxName,
    required VoidCallback onRegisterAdapter,
  }) async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      onRegisterAdapter();
      await Hive.openBox<T>(boxName);
      return true;
    } catch (err) {
      throw Exception('Failed to init db: $err');
    }
  }

  @override
  Future<List<T>> getAll<T>({
    required String boxName,
  }) async {
    try {
      final box = Hive.box<T>(boxName);
      final result = box.values.toList();
      return Future.value(result);
    } catch (err) {
      throw Exception('Failed to get all: $err');
    }
  }

  @override
  Future<T> getById<T>({
    required String modelId,
    required String boxName,
  }) {
    try {
      final box = Hive.box<T>(boxName);
      return Future.value(box.get(modelId));
    } catch (err) {
      throw Exception('Failed to get by id: $err');
    }
  }

  @override
  Stream<List<T>> watchAll<T>({
    required String boxName,
  }) {
    try {
      final box = Hive.box<T>(boxName);
      return box.watch().map((event) => box.values.toList());
    } catch (err) {
      throw Exception('Failed to watch all: $err');
    }
  }

  @override
  Future<void> add<T>({
    required String boxName,
    required String modelId,
    required T modelHive,
  }) {
    try {
      final box = Hive.box<T>(boxName);
      box.put(modelId, modelHive);
      return Future.value();
    } catch (err) {
      throw Exception('Failed to add: $err');
    }
  }

  @override
  Future<void> update<T>({
    required String modelId,
    required String boxName,
    required T modelHive,
  }) {
    try {
      final box = Hive.box<T>(boxName);
      box.put(modelId, modelHive);
      return Future.value();
    } catch (err) {
      throw Exception('Failed to update: $err');
    }
  }

  @override
  Future<void> delete<T>({
    required String modelId,
    required String boxName,
  }) {
    try {
      final box = Hive.box<T>(boxName);
      box.delete(modelId);
      return Future.value();
    } catch (err) {
      throw Exception('Failed to delete: $err');
    }
  }

  @override
  Future<void> clearAll<T>({
    required String boxName,
  }) {
    try {
      final box = Hive.box<T>(boxName);
      box.clear();

      return Future.value();
    } catch (err) {
      throw Exception('Failed to clear all: $err');
    }
  }

  @override
  Future<void> closeDb() {
    try {
      Hive.close();
      return Future.value();
    } catch (err) {
      throw Exception('Failed to close db: $err');
    }
  }
}
