abstract class Storage<K, V, R> {
  Future<R> put({required K key, required V value});

  Future<V> get({required K key});

  Map<K, V> getAll();

  Future<R> putAll({required Map<K, V> data});

  Future<R> delete({required K key});

  Future<R> deleteAll();
}
