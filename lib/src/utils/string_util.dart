
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
}