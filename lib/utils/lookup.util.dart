R lookup<R, K>(Map<K, dynamic> map, Iterable<K> keys) {
  dynamic current = map;
  for (final key in keys) {
    if (current is Map<K, dynamic>) {
      current = current[key];
    } else {
      return null;
    }
  }
  try {
    return current as R;
  } catch (e) {
    return null;
  }
}
