
class Util {
  static bool isValidList<T>(dynamic list){
    if(list != null && list is List<T> && list.isNotEmpty){
      return true;
    }
    return false;
  }
}