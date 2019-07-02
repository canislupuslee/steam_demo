import 'dart:core';

class NFCDecode{
  static int decodeHexString(String str){
    str =HighLowHex(spaceHex(str));
    return int.parse(str, radix: 16);
  }

  static  String spaceHex(String str){
    int len = str.length;
    var array= str.substring(2,len).split("");
    if(len<=2) return str;
    String result="";
    for(int i=0;i<array.length;i++){
      int start =i+1;
      if(start%2==0){
        result =result+array[i]+" ";
      }else{
        result =result+array[i];
      }
    }
    print("第一次处理："+result);
    return result;
  }

  // 高低位转换
  static String HighLowHex(String str){
    int len = str.trim().length;
    if(len<=2) return str;

    List<String>  list = str.split(" ");
    String result="";
    list = list.reversed.toList();
    for(int i=0;i<list.length;i++){
      result = result+list[i];
    }
    print('第二次输出'+result);
    return result;
  }
}