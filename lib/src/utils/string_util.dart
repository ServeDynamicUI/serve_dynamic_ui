
class StringUtil {

  static isUrlAssetPath(String path){
    try {
      Uri uri = Uri.parse(path);
      return !(uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https'));
    } catch (e) {
      return true;
    }
  }

  static isNotEmptyNorNull(String? path){
    return path != null && path.isNotEmpty;
  }

  static String? replaceAllUsingReplacers(
      String? string,
      Map<String, String>? keyValues,
      ) {
    var replacedString = string;
    keyValues?.forEach((key, value) {
      replacedString = replacedString?.replaceAll(key, value!);
    });
    return replacedString;
  }
}

extension BoolParsing on String {
  bool? parseBool() {
    return toLowerCase() == 'true';
  }
}