
class StringUtil {

  static isUrlAssetPath(String path){
    return path.endsWith(".json");
  }

  static isNotEmptyNorNull(String? path){
    return path != null && path.isNotEmpty;
  }
}