enum languageType{ENGLISH, ARAPIC}
const String ARAPIC="ar";
const String ENGLISH="en";
extension languageTypeExtention on languageType{
  String getValue(){
    switch(this){
      case languageType.ENGLISH:
      return ENGLISH;
              break;
      case languageType.ARAPIC:
    return ARAPIC;
        break;
    }
  }
}