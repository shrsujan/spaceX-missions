String interpolate(String str, Map<String, dynamic> values) {
  String resolvedStr = str;

  values.forEach((key, value) {
    resolvedStr = resolvedStr.replaceAll(':$key', value);
  });

  return resolvedStr;
}
