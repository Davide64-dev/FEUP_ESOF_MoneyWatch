class Validator{


  static bool isValidAmount(var x){
    int count = 0;
    int countZeros = 0;
    for (int i = 0; i < x.length;i++){
      if (x[i] == ',') return false;
      if(x[i] == '.') count++;
      if (count == 2) return false;
      if(x[i] == '0') countZeros++;
    }
    if(countZeros == x.length) return false;
    if (x == "" || x == '.') return false;
    if (x == 0) return false;

    return true;
  }
}