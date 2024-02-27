import 'package:flutter/material.dart';

abstract class DbHiveClientBase {
  Future<bool> initDb<T>({
    required String boxName,
    required VoidCallback onRegisterAdapter,
  });

  Future<List<T>> getAll<T>({
    required String boxName,
  });

  Future<T> getById<T>({
    required String modelId,
    required String boxName,
  });

  Future<void> add<T>({
    required String modelId,
    required T modelHive,
    required String boxName,
  });

  Future<void> update<T>({
    required String modelId,
    required String boxName,
    required T modelHive,
  });

  Future<void> delete<T>({
    required String modelId,
    required String boxName,
  });

  Future<void> clearAll<T>({
    required String boxName,
  });

  Stream<List<T>> watchAll<T>({
    required String boxName,
  });

  Future<void> closeDb();
}
