abstract class DbHiveClientBase {
  Future<bool> initDb({
    required String dbName,
    required List<Type> adapterList,
  });

  Future<List<T>> getAll<T>({
    required String boxName,
  });

  Future<T> getById<T>({
    required String modelId,
    required String boxName,
  });

  Future<void> add<T>({
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
