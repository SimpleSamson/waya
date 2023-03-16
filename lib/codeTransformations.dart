import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waya/globalFx.dart';
import 'globalFx.dart';
class wayaCodeMap {
  String? cASCII;
  int? cBinary;
  int? cOct;
  String? cDecimal;
  String? cHex;

  wayaCodeMap({this.cASCII, this.cBinary, this.cOct, this.cDecimal, this.cHex});
  wayaCodeMap.fromJson(Map<String, dynamic> json){
    cASCII = json['ASCII'];
    cBinary = json['Binary'];
    cHex = json['Hex'];
    cOct = json['Oct'];
    cDecimal = json['Decimal'];
  }
}

String codeTransformation(String sourceCode, String sourceCodeText, String resultCode){
  var x;
  const List<Map<String, dynamic>> codesJson = [
    {"ASCII":"null", "Decimal":0, "Hex":"0", "Oct":0, "Binary":"0"},
    {"ASCII":"start of header", "Decimal":1, "Hex":"1", "Oct":1, "Binary":"1"},
    {"ASCII":"start of text", "Decimal":2, "Hex":"2", "Oct":2, "Binary":"10"},
    {"ASCII":"end of text", "Decimal":3, "Hex":"3", "Oct":3, "Binary":"11"},
    {"ASCII":"end of transmission", "Decimal":4, "Hex":"4", "Oct":4, "Binary":"100"},
    {"ASCII":"enquire", "Decimal":5, "Hex":"5", "Oct":5, "Binary":"101"},
    {"ASCII":"acknowledge", "Decimal":6, "Hex":"6", "Oct":6, "Binary":"110"},
    {"ASCII":"bell", "Decimal":7, "Hex":"7", "Oct":7, "Binary":"111"},
    {"ASCII":"backspace", "Decimal":8, "Hex":"8", "Oct":10, "Binary":"1000"},
    {"ASCII":"horizontal tab", "Decimal":9, "Hex":"9", "Oct":11, "Binary":"1001"},
    {"ASCII":"linefeed", "Decimal":10, "Hex":"A", "Oct":12, "Binary":"1010"},
    {"ASCII":"vertical tab", "Decimal":11, "Hex":"B", "Oct":13, "Binary":"1011"},
    {"ASCII":"form feed", "Decimal":12, "Hex":"C", "Oct":14, "Binary":"1100"},
    {"ASCII":"carriage return", "Decimal":13, "Hex":"D", "Oct":15, "Binary":"1101"},
    {"ASCII":"shift out", "Decimal":14, "Hex":"E", "Oct":16, "Binary":"1110"},
    {"ASCII":"shift in", "Decimal":15, "Hex":"F", "Oct":17, "Binary":"1111"},
    {"ASCII":"data link escape", "Decimal":16, "Hex":"10", "Oct":20, "Binary":"10000"},
    {"ASCII":"device control 1/Xon", "Decimal":17, "Hex":"11", "Oct":21, "Binary":"10001"},
    {"ASCII":"device control 2", "Decimal":18, "Hex":"12", "Oct":22, "Binary":"10010"},
    {"ASCII":"device control 3/Xoff", "Decimal":19, "Hex":"13", "Oct":23, "Binary":"10011"},
    {"ASCII":"device control 4", "Decimal":20, "Hex":"14", "Oct":24, "Binary":"10100"},
    {"ASCII":"negative acknowledge", "Decimal":21, "Hex":"15", "Oct":25, "Binary":"10101"},
    {"ASCII":"synchronous idle", "Decimal":22, "Hex":"16", "Oct":26, "Binary":"10110"},
    {"ASCII":"end of transmission block", "Decimal":23, "Hex":"17", "Oct":27, "Binary":"10111"},
    {"ASCII":"cancel", "Decimal":24, "Hex":"18", "Oct":30, "Binary":"11000"},
    {"ASCII":"end of medium", "Decimal":25, "Hex":"19", "Oct":31, "Binary":"11001"},
    {"ASCII":"end of file/ substitute", "Decimal":26, "Hex":"1A", "Oct":32, "Binary":"11010"},
    {"ASCII":"escape", "Decimal":27, "Hex":"1B", "Oct":33, "Binary":"11011"},
    {"ASCII":"file separator", "Decimal":28, "Hex":"1C", "Oct":34, "Binary":"11100"},
    {"ASCII":"group separator", "Decimal":29, "Hex":"1D", "Oct":35, "Binary":"11101"},
    {"ASCII":"record separator", "Decimal":30, "Hex":"1E", "Oct":36, "Binary":"11110"},
    {"ASCII":"unit separator", "Decimal":31, "Hex":"1F", "Oct":37, "Binary":"11111"},
    {"ASCII":"space", "Decimal":32, "Hex":"20", "Oct":40, "Binary":"100000"},
    {"ASCII":"!", "Decimal":33, "Hex":"21", "Oct":41, "Binary":"100001"},
    {"ASCII":"\"", "Decimal":34, "Hex":"22", "Oct":42, "Binary":"100010"}, //check this ASCII
    {"ASCII":"#", "Decimal":35, "Hex":"23", "Oct":43, "Binary":"100011"},
    {"ASCII":"\$", "Decimal":36, "Hex":"24", "Oct":44, "Binary":"100100"}, //check this ASCII
    {"ASCII":"%", "Decimal":37, "Hex":"25", "Oct":45, "Binary":"100101"},
    {"ASCII":"&amp;", "Decimal":38, "Hex":"26", "Oct":46, "Binary":"100110"},
    {"ASCII":"'", "Decimal":39, "Hex":"27", "Oct":47, "Binary":"100111"},
    {"ASCII":"(", "Decimal":40, "Hex":"28", "Oct":50, "Binary":"101000"},
    {"ASCII":")", "Decimal":41, "Hex":"29", "Oct":51, "Binary":"101001"},
    {"ASCII":"*", "Decimal":42, "Hex":"2A", "Oct":52, "Binary":"101010"},
    {"ASCII":"+", "Decimal":43, "Hex":"2B", "Oct":53, "Binary":"101011"},
    {"ASCII":",", "Decimal":44, "Hex":"2C", "Oct":54, "Binary":"101100"},
    {"ASCII":"-", "Decimal":45, "Hex":"2D", "Oct":55, "Binary":"101101"},
    {"ASCII":".", "Decimal":46, "Hex":"2E", "Oct":56, "Binary":"101110"},
    {"ASCII":"/", "Decimal":47, "Hex":"2F", "Oct":57, "Binary":"101111"},
    {"ASCII":"0", "Decimal":48, "Hex":"30", "Oct":60, "Binary":"110000"},
    {"ASCII":"1", "Decimal":49, "Hex":"31", "Oct":61, "Binary":"110001"},
    {"ASCII":"2", "Decimal":50, "Hex":"32", "Oct":62, "Binary":"110010"},
    {"ASCII":"3", "Decimal":51, "Hex":"33", "Oct":63, "Binary":"110011"},
    {"ASCII":"4", "Decimal":52, "Hex":"34", "Oct":64, "Binary":"110100"},
    {"ASCII":"5", "Decimal":53, "Hex":"35", "Oct":65, "Binary":"110101"},
    {"ASCII":"6", "Decimal":54, "Hex":"36", "Oct":66, "Binary":"110110"},
    {"ASCII":"7", "Decimal":55, "Hex":"37", "Oct":67, "Binary":"110111"},
    {"ASCII":"8", "Decimal":56, "Hex":"38", "Oct":70, "Binary":"111000"},
    {"ASCII":"9", "Decimal":57, "Hex":"39", "Oct":71, "Binary":"111001"},
    {"ASCII":":", "Decimal":58, "Hex":"3A", "Oct":72, "Binary":"111010"},
    {"ASCII":";", "Decimal":59, "Hex":"3B", "Oct":73, "Binary":"111011"},
    {"ASCII":"&lt;", "Decimal":60, "Hex":"3C", "Oct":74, "Binary":"111100"},
    {"ASCII":"=", "Decimal":61, "Hex":"3D", "Oct":75, "Binary":"111101"},
    {"ASCII":"&gt;", "Decimal":62, "Hex":"3E", "Oct":76, "Binary":"111110"},
    {"ASCII":"?", "Decimal":63, "Hex":"3F", "Oct":77, "Binary":"111111"},
    {"ASCII":"@", "Decimal":64, "Hex":"40", "Oct":100, "Binary":"1000000"},
    {"ASCII":"A", "Decimal":65, "Hex":"41", "Oct":101, "Binary":"1000001"},
    {"ASCII":"B", "Decimal":66, "Hex":"42", "Oct":102, "Binary":"1000010"},
    {"ASCII":"C", "Decimal":67, "Hex":"43", "Oct":103, "Binary":"1000011"},
    {"ASCII":"D", "Decimal":68, "Hex":"44", "Oct":104, "Binary":"1000100"},
    {"ASCII":"E", "Decimal":69, "Hex":"45", "Oct":105, "Binary":"1000101"},
    {"ASCII":"F", "Decimal":70, "Hex":"46", "Oct":106, "Binary":"1000110"},
    {"ASCII":"G", "Decimal":71, "Hex":"47", "Oct":107, "Binary":"1000111"},
    {"ASCII":"H", "Decimal":72, "Hex":"48", "Oct":110, "Binary":"1001000"},
    {"ASCII":"I", "Decimal":73, "Hex":"49", "Oct":111, "Binary":"1001001"},
    {"ASCII":"J", "Decimal":74, "Hex":"4A", "Oct":112, "Binary":"1001010"},
    {"ASCII":"K", "Decimal":75, "Hex":"4B", "Oct":113, "Binary":"1001011"},
    {"ASCII":"L", "Decimal":76, "Hex":"4C", "Oct":114, "Binary":"1001100"},
    {"ASCII":"M", "Decimal":77, "Hex":"4D", "Oct":115, "Binary":"1001101"},
    {"ASCII":"N", "Decimal":78, "Hex":"4E", "Oct":116, "Binary":"1001110"},
    {"ASCII":"O", "Decimal":79, "Hex":"4F", "Oct":117, "Binary":"1001111"},
    {"ASCII":"P", "Decimal":80, "Hex":"50", "Oct":120, "Binary":"1010000"},
    {"ASCII":"Q", "Decimal":81, "Hex":"51", "Oct":121, "Binary":"1010001"},
    {"ASCII":"R", "Decimal":82, "Hex":"52", "Oct":122, "Binary":"1010010"},
    {"ASCII":"S", "Decimal":83, "Hex":"53", "Oct":123, "Binary":"1010011"},
    {"ASCII":"T", "Decimal":84, "Hex":"54", "Oct":124, "Binary":"1010100"},
    {"ASCII":"U", "Decimal":85, "Hex":"55", "Oct":125, "Binary":"1010101"},
    {"ASCII":"V", "Decimal":86, "Hex":"56", "Oct":126, "Binary":"1010110"},
    {"ASCII":"W", "Decimal":87, "Hex":"57", "Oct":127, "Binary":"1010111"},
    {"ASCII":"X", "Decimal":88, "Hex":"58", "Oct":130, "Binary":"1011000"},
    {"ASCII":"Y", "Decimal":89, "Hex":"59", "Oct":131, "Binary":"1011001"},
    {"ASCII":"Z", "Decimal":90, "Hex":"5A", "Oct":132, "Binary":"1011010"},
    {"ASCII":"[", "Decimal":91, "Hex":"5B", "Oct":133, "Binary":"1011011"},
    {"ASCII":"\\", "Decimal":92, "Hex":"5C", "Oct":134, "Binary":"1011100"}, //check this ASCII
    {"ASCII":"]", "Decimal":93, "Hex":"5D", "Oct":135, "Binary":"1011101"},
    {"ASCII":"^", "Decimal":94, "Hex":"5E", "Oct":136, "Binary":"1011110"},
    {"ASCII":"_", "Decimal":95, "Hex":"5F", "Oct":137, "Binary":"1011111"},
    {"ASCII":"`", "Decimal":96, "Hex":"60", "Oct":140, "Binary":"1100000"},
    {"ASCII":"a", "Decimal":97, "Hex":"61", "Oct":141, "Binary":"1100001"},
    {"ASCII":"b", "Decimal":98, "Hex":"62", "Oct":142, "Binary":"1100010"},
    {"ASCII":"c", "Decimal":99, "Hex":"63", "Oct":143, "Binary":"1100011"},
    {"ASCII":"d", "Decimal":100, "Hex":"64", "Oct":144, "Binary":"1100100"},
    {"ASCII":"e", "Decimal":101, "Hex":"65", "Oct":145, "Binary":"1100101"},
    {"ASCII":"f", "Decimal":102, "Hex":"66", "Oct":146, "Binary":"1100110"},
    {"ASCII":"g", "Decimal":103, "Hex":"67", "Oct":147, "Binary":"1100111"},
    {"ASCII":"h", "Decimal":104, "Hex":"68", "Oct":150, "Binary":"1101000"},
    {"ASCII":"i", "Decimal":105, "Hex":"69", "Oct":151, "Binary":"1101001"},
    {"ASCII":"j", "Decimal":106, "Hex":"6A", "Oct":152, "Binary":"1101010"},
    {"ASCII":"k", "Decimal":107, "Hex":"6B", "Oct":153, "Binary":"1101011"},
    {"ASCII":"l", "Decimal":108, "Hex":"6C", "Oct":154, "Binary":"1101100"},
    {"ASCII":"m", "Decimal":109, "Hex":"6D", "Oct":155, "Binary":"1101101"},
    {"ASCII":"n", "Decimal":110, "Hex":"6E", "Oct":156, "Binary":"1101110"},
    {"ASCII":"o", "Decimal":111, "Hex":"6F", "Oct":157, "Binary":"1101111"},
    {"ASCII":"p", "Decimal":112, "Hex":"70", "Oct":160, "Binary":"1110000"},
    {"ASCII":"q", "Decimal":113, "Hex":"71", "Oct":161, "Binary":"1110001"},
    {"ASCII":"r", "Decimal":114, "Hex":"72", "Oct":162, "Binary":"1110010"},
    {"ASCII":"s", "Decimal":115, "Hex":"73", "Oct":163, "Binary":"1110011"},
    {"ASCII":"t", "Decimal":116, "Hex":"74", "Oct":164, "Binary":"1110100"},
    {"ASCII":"u", "Decimal":117, "Hex":"75", "Oct":165, "Binary":"1110101"},
    {"ASCII":"v", "Decimal":118, "Hex":"76", "Oct":166, "Binary":"1110110"},
    {"ASCII":"w", "Decimal":119, "Hex":"77", "Oct":167, "Binary":"1110111"},
    {"ASCII":"x", "Decimal":120, "Hex":"78", "Oct":170, "Binary":"1111000"},
    {"ASCII":"y", "Decimal":121, "Hex":"79", "Oct":171, "Binary":"1111001"},
    {"ASCII":"z", "Decimal":122, "Hex":"7A", "Oct":172, "Binary":"1111010"},
    {"ASCII":"{", "Decimal":123, "Hex":"7B", "Oct":173, "Binary":"1111011"},
    {"ASCII":"|", "Decimal":124, "Hex":"7C", "Oct":174, "Binary":"1111100"},
    {"ASCII":"}", "Decimal":125, "Hex":"7D", "Oct":175, "Binary":"1111101"},
    {"ASCII":"~", "Decimal":126, "Hex":"7E", "Oct":176, "Binary":"1111110"},
    {"ASCII":"DEL", "Decimal":127, "Hex":"7F", "Oct":177, "Binary":"1111111"},
    {"ASCII":"&nbsp;", "Decimal":128, "Hex":"80", "Oct":200, "Binary":"10000000"},
    {"ASCII":"&nbsp;", "Decimal":129, "Hex":"81", "Oct":201, "Binary":"10000001"},
    {"ASCII":"&nbsp;", "Decimal":130, "Hex":"82", "Oct":202, "Binary":"10000010"},
    {"ASCII":"&nbsp;", "Decimal":131, "Hex":"83", "Oct":203, "Binary":"10000011"},
    {"ASCII":"&nbsp;", "Decimal":132, "Hex":"84", "Oct":204, "Binary":"10000100"},
    {"ASCII":"&nbsp;", "Decimal":133, "Hex":"85", "Oct":205, "Binary":"10000101"},
    {"ASCII":"&nbsp;", "Decimal":134, "Hex":"86", "Oct":206, "Binary":"10000110"},
    {"ASCII":"&nbsp;", "Decimal":135, "Hex":"87", "Oct":207, "Binary":"10000111"},
    {"ASCII":"&nbsp;", "Decimal":136, "Hex":"88", "Oct":210, "Binary":"10001000"},
    {"ASCII":"&nbsp;", "Decimal":137, "Hex":"89", "Oct":211, "Binary":"10001001"},
    {"ASCII":"&nbsp;", "Decimal":138, "Hex":"8A", "Oct":212, "Binary":"10001010"},
    {"ASCII":"&nbsp;", "Decimal":139, "Hex":"8B", "Oct":213, "Binary":"10001011"},
    {"ASCII":"&nbsp;", "Decimal":140, "Hex":"8C", "Oct":214, "Binary":"10001100"},
    {"ASCII":"&nbsp;", "Decimal":141, "Hex":"8D", "Oct":215, "Binary":"10001101"},
    {"ASCII":"&nbsp;", "Decimal":142, "Hex":"8E", "Oct":216, "Binary":"10001110"},
    {"ASCII":"&nbsp;", "Decimal":143, "Hex":"8F", "Oct":217, "Binary":"10001111"},
    {"ASCII":"&nbsp;", "Decimal":144, "Hex":"90", "Oct":220, "Binary":"10010000"},
    {"ASCII":"&nbsp;", "Decimal":145, "Hex":"91", "Oct":221, "Binary":"10010001"},
    {"ASCII":"&nbsp;", "Decimal":146, "Hex":"92", "Oct":222, "Binary":"10010010"},
    {"ASCII":"&nbsp;", "Decimal":147, "Hex":"93", "Oct":223, "Binary":"10010011"},
    {"ASCII":"&nbsp;", "Decimal":148, "Hex":"94", "Oct":224, "Binary":"10010100"},
    {"ASCII":"&nbsp;", "Decimal":149, "Hex":"95", "Oct":225, "Binary":"10010101"},
    {"ASCII":"&nbsp;", "Decimal":150, "Hex":"96", "Oct":226, "Binary":"10010110"},
    {"ASCII":"&nbsp;", "Decimal":151, "Hex":"97", "Oct":227, "Binary":"10010111"},
    {"ASCII":"&nbsp;", "Decimal":152, "Hex":"98", "Oct":230, "Binary":"10011000"},
    {"ASCII":"&nbsp;", "Decimal":153, "Hex":"99", "Oct":231, "Binary":"10011001"},
    {"ASCII":"&nbsp;", "Decimal":154, "Hex":"9A", "Oct":232, "Binary":"10011010"},
    {"ASCII":"&nbsp;", "Decimal":155, "Hex":"9B", "Oct":233, "Binary":"10011011"},
    {"ASCII":"&nbsp;", "Decimal":156, "Hex":"9C", "Oct":234, "Binary":"10011100"},
    {"ASCII":"&nbsp;", "Decimal":157, "Hex":"9D", "Oct":235, "Binary":"10011101"},
    {"ASCII":"&nbsp;", "Decimal":158, "Hex":"9E", "Oct":236, "Binary":"10011110"},
    {"ASCII":"&nbsp;", "Decimal":159, "Hex":"9F", "Oct":237, "Binary":"10011111"},
    {"ASCII":"&nbsp;", "Decimal":160, "Hex":"A0", "Oct":240, "Binary":"10100000"},
    {"ASCII":"&nbsp;", "Decimal":161, "Hex":"A1", "Oct":241, "Binary":"10100001"},
    {"ASCII":"&nbsp;", "Decimal":162, "Hex":"A2", "Oct":242, "Binary":"10100010"},
    {"ASCII":"&nbsp;", "Decimal":163, "Hex":"A3", "Oct":243, "Binary":"10100011"},
    {"ASCII":"&nbsp;", "Decimal":164, "Hex":"A4", "Oct":244, "Binary":"10100100"},
    {"ASCII":"&nbsp;", "Decimal":165, "Hex":"A5", "Oct":245, "Binary":"10100101"},
    {"ASCII":"&nbsp;", "Decimal":166, "Hex":"A6", "Oct":246, "Binary":"10100110"},
    {"ASCII":"&nbsp;", "Decimal":167, "Hex":"A7", "Oct":247, "Binary":"10100111"},
    {"ASCII":"&nbsp;", "Decimal":168, "Hex":"A8", "Oct":250, "Binary":"10101000"},
    {"ASCII":"&nbsp;", "Decimal":169, "Hex":"A9", "Oct":251, "Binary":"10101001"},
    {"ASCII":"&nbsp;", "Decimal":170, "Hex":"AA", "Oct":252, "Binary":"10101010"},
    {"ASCII":"&nbsp;", "Decimal":171, "Hex":"AB", "Oct":253, "Binary":"10101011"},
    {"ASCII":"&nbsp;", "Decimal":172, "Hex":"AC", "Oct":254, "Binary":"10101100"},
    {"ASCII":"&nbsp;", "Decimal":173, "Hex":"AD", "Oct":255, "Binary":"10101101"},
    {"ASCII":"&nbsp;", "Decimal":174, "Hex":"AE", "Oct":256, "Binary":"10101110"},
    {"ASCII":"&nbsp;", "Decimal":175, "Hex":"AF", "Oct":257, "Binary":"10101111"},
    {"ASCII":"&nbsp;", "Decimal":176, "Hex":"B0", "Oct":260, "Binary":"10110000"},
    {"ASCII":"&nbsp;", "Decimal":177, "Hex":"B1", "Oct":261, "Binary":"10110001"},
    {"ASCII":"&nbsp;", "Decimal":178, "Hex":"B2", "Oct":262, "Binary":"10110010"},
    {"ASCII":"&nbsp;", "Decimal":179, "Hex":"B3", "Oct":263, "Binary":"10110011"},
    {"ASCII":"&nbsp;", "Decimal":180, "Hex":"B4", "Oct":264, "Binary":"10110100"},
    {"ASCII":"&nbsp;", "Decimal":181, "Hex":"B5", "Oct":265, "Binary":"10110101"},
    {"ASCII":"&nbsp;", "Decimal":182, "Hex":"B6", "Oct":266, "Binary":"10110110"},
    {"ASCII":"&nbsp;", "Decimal":183, "Hex":"B7", "Oct":267, "Binary":"10110111"},
    {"ASCII":"&nbsp;", "Decimal":184, "Hex":"B8", "Oct":270, "Binary":"10111000"},
    {"ASCII":"&nbsp;", "Decimal":185, "Hex":"B9", "Oct":271, "Binary":"10111001"},
    {"ASCII":"&nbsp;", "Decimal":186, "Hex":"BA", "Oct":272, "Binary":"10111010"},
    {"ASCII":"&nbsp;", "Decimal":187, "Hex":"BB", "Oct":273, "Binary":"10111011"},
    {"ASCII":"&nbsp;", "Decimal":188, "Hex":"BC", "Oct":274, "Binary":"10111100"},
    {"ASCII":"&nbsp;", "Decimal":189, "Hex":"BD", "Oct":275, "Binary":"10111101"},
    {"ASCII":"&nbsp;", "Decimal":190, "Hex":"BE", "Oct":276, "Binary":"10111110"},
    {"ASCII":"&nbsp;", "Decimal":191, "Hex":"BF", "Oct":277, "Binary":"10111111"},
    {"ASCII":"&nbsp;", "Decimal":192, "Hex":"C0", "Oct":300, "Binary":"11000000"},
    {"ASCII":"&nbsp;", "Decimal":193, "Hex":"C1", "Oct":301, "Binary":"11000001"},
    {"ASCII":"&nbsp;", "Decimal":194, "Hex":"C2", "Oct":302, "Binary":"11000010"},
    {"ASCII":"&nbsp;", "Decimal":195, "Hex":"C3", "Oct":303, "Binary":"11000011"},
    {"ASCII":"&nbsp;", "Decimal":196, "Hex":"C4", "Oct":304, "Binary":"11000100"},
    {"ASCII":"&nbsp;", "Decimal":197, "Hex":"C5", "Oct":305, "Binary":"11000101"},
    {"ASCII":"&nbsp;", "Decimal":198, "Hex":"C6", "Oct":306, "Binary":"11000110"},
    {"ASCII":"&nbsp;", "Decimal":199, "Hex":"C7", "Oct":307, "Binary":"11000111"},
    {"ASCII":"&nbsp;", "Decimal":200, "Hex":"C8", "Oct":310, "Binary":"11001000"},
    {"ASCII":"&nbsp;", "Decimal":201, "Hex":"C9", "Oct":311, "Binary":"11001001"},
    {"ASCII":"&nbsp;", "Decimal":202, "Hex":"CA", "Oct":312, "Binary":"11001010"},
    {"ASCII":"&nbsp;", "Decimal":203, "Hex":"CB", "Oct":313, "Binary":"11001011"},
    {"ASCII":"&nbsp;", "Decimal":204, "Hex":"CC", "Oct":314, "Binary":"11001100"},
    {"ASCII":"&nbsp;", "Decimal":205, "Hex":"CD", "Oct":315, "Binary":"11001101"},
    {"ASCII":"&nbsp;", "Decimal":206, "Hex":"CE", "Oct":316, "Binary":"11001110"},
    {"ASCII":"&nbsp;", "Decimal":207, "Hex":"CF", "Oct":317, "Binary":"11001111"},
    {"ASCII":"&nbsp;", "Decimal":208, "Hex":"D0", "Oct":320, "Binary":"11010000"},
    {"ASCII":"&nbsp;", "Decimal":209, "Hex":"D1", "Oct":321, "Binary":"11010001"},
    {"ASCII":"&nbsp;", "Decimal":210, "Hex":"D2", "Oct":322, "Binary":"11010010"},
    {"ASCII":"&nbsp;", "Decimal":211, "Hex":"D3", "Oct":323, "Binary":"11010011"},
    {"ASCII":"&nbsp;", "Decimal":212, "Hex":"D4", "Oct":324, "Binary":"11010100"},
    {"ASCII":"&nbsp;", "Decimal":213, "Hex":"D5", "Oct":325, "Binary":"11010101"},
    {"ASCII":"&nbsp;", "Decimal":214, "Hex":"D6", "Oct":326, "Binary":"11010110"},
    {"ASCII":"&nbsp;", "Decimal":215, "Hex":"D7", "Oct":327, "Binary":"11010111"},
    {"ASCII":"&nbsp;", "Decimal":216, "Hex":"D8", "Oct":330, "Binary":"11011000"},
    {"ASCII":"&nbsp;", "Decimal":217, "Hex":"D9", "Oct":331, "Binary":"11011001"},
    {"ASCII":"&nbsp;", "Decimal":218, "Hex":"DA", "Oct":332, "Binary":"11011010"},
    {"ASCII":"&nbsp;", "Decimal":219, "Hex":"DB", "Oct":333, "Binary":"11011011"},
    {"ASCII":"&nbsp;", "Decimal":220, "Hex":"DC", "Oct":334, "Binary":"11011100"},
    {"ASCII":"&nbsp;", "Decimal":221, "Hex":"DD", "Oct":335, "Binary":"11011101"},
    {"ASCII":"&nbsp;", "Decimal":222, "Hex":"DE", "Oct":336, "Binary":"11011110"},
    {"ASCII":"&nbsp;", "Decimal":223, "Hex":"DF", "Oct":337, "Binary":"11011111"},
    {"ASCII":"&nbsp;", "Decimal":224, "Hex":"E0", "Oct":340, "Binary":"11100000"},
    {"ASCII":"&nbsp;", "Decimal":225, "Hex":"E1", "Oct":341, "Binary":"11100001"},
    {"ASCII":"&nbsp;", "Decimal":226, "Hex":"E2", "Oct":342, "Binary":"11100010"},
    {"ASCII":"&nbsp;", "Decimal":227, "Hex":"E3", "Oct":343, "Binary":"11100011"},
    {"ASCII":"&nbsp;", "Decimal":228, "Hex":"E4", "Oct":344, "Binary":"11100100"},
    {"ASCII":"&nbsp;", "Decimal":229, "Hex":"E5", "Oct":345, "Binary":"11100101"},
    {"ASCII":"&nbsp;", "Decimal":230, "Hex":"E6", "Oct":346, "Binary":"11100110"},
    {"ASCII":"&nbsp;", "Decimal":231, "Hex":"E7", "Oct":347, "Binary":"11100111"},
    {"ASCII":"&nbsp;", "Decimal":232, "Hex":"E8", "Oct":350, "Binary":"11101000"},
    {"ASCII":"&nbsp;", "Decimal":233, "Hex":"E9", "Oct":351, "Binary":"11101001"},
    {"ASCII":"&nbsp;", "Decimal":234, "Hex":"EA", "Oct":352, "Binary":"11101010"},
    {"ASCII":"&nbsp;", "Decimal":235, "Hex":"EB", "Oct":353, "Binary":"11101011"},
    {"ASCII":"&nbsp;", "Decimal":236, "Hex":"EC", "Oct":354, "Binary":"11101100"},
    {"ASCII":"&nbsp;", "Decimal":237, "Hex":"ED", "Oct":355, "Binary":"11101101"},
    {"ASCII":"&nbsp;", "Decimal":238, "Hex":"EE", "Oct":356, "Binary":"11101110"},
    {"ASCII":"&nbsp;", "Decimal":239, "Hex":"EF", "Oct":357, "Binary":"11101111"},
    {"ASCII":"&nbsp;", "Decimal":240, "Hex":"F0", "Oct":360, "Binary":"11110000"},
    {"ASCII":"&nbsp;", "Decimal":241, "Hex":"F1", "Oct":361, "Binary":"11110001"},
    {"ASCII":"&nbsp;", "Decimal":242, "Hex":"F2", "Oct":362, "Binary":"11110010"},
    {"ASCII":"&nbsp;", "Decimal":243, "Hex":"F3", "Oct":363, "Binary":"11110011"},
    {"ASCII":"&nbsp;", "Decimal":244, "Hex":"F4", "Oct":364, "Binary":"11110100"},
    {"ASCII":"&nbsp;", "Decimal":245, "Hex":"F5", "Oct":365, "Binary":"11110101"},
    {"ASCII":"&nbsp;", "Decimal":246, "Hex":"F6", "Oct":366, "Binary":"11110110"},
    {"ASCII":"&nbsp;", "Decimal":247, "Hex":"F7", "Oct":367, "Binary":"11110111"},
    {"ASCII":"&nbsp;", "Decimal":248, "Hex":"F8", "Oct":370, "Binary":"11111000"},
    {"ASCII":"&nbsp;", "Decimal":249, "Hex":"F9", "Oct":371, "Binary":"11111001"},
    {"ASCII":"&nbsp;", "Decimal":250, "Hex":"FA", "Oct":372, "Binary":"11111010"},
    {"ASCII":"&nbsp;", "Decimal":251, "Hex":"FB", "Oct":373, "Binary":"11111011"},
    {"ASCII":"&nbsp;", "Decimal":252, "Hex":"FC", "Oct":374, "Binary":"11111100"},
    {"ASCII":"&nbsp;", "Decimal":253, "Hex":"FD", "Oct":375, "Binary":"11111101"},
    {"ASCII":"&nbsp;", "Decimal":254, "Hex":"FE", "Oct":376, "Binary":"11111110"},
    {"ASCII":"&nbsp;", "Decimal":255, "Hex":"FF", "Oct":377, "Binary":"11111111"}
  ];

  final List <Map<String, dynamic>> thecodes = codesJson;
  var xg = thecodes.where((element) => element.containsValue(sourceCodeText)).toString().replaceAll('({', '').replaceAll('})', '');
  return xg;
}


class codeCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => codeCalculatorState();
}
class codeCalculatorState extends State<codeCalculator>{
  String availableCodeType = 'Decimal';
  String resultType = 'Hexadecimal';

  var availableCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: wayaTitle(),),
        body: ListView(
          children: [Center(
            child: Padding(padding: const EdgeInsets.all(49),
                child: Form(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('ASCII: w, \n Binary: 00000001 \n Hexadecimal: 1A \n Decimal:12 \n  Octadecimal:31', style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w200),),
                    Padding(padding: const EdgeInsets.only(bottom: 17)),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'Select Current Format'),
                      value: availableCodeType,
                      onChanged: (String? newValue){
                        setState(() {
                          availableCodeType = newValue!;
                        });},
                      items: <String>['ASCII', 'Decimal', 'Hexadecimal', 'Binary', 'Octadecimal']
                          .map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(labelText: 'Select Destination Format'),
                      value: resultType,
                      onChanged: (String? newValue2){
                        setState(() {
                          resultType = newValue2!;
                        });},
                      items: <String>['ASCII', 'Hexadecimal', 'Decimal', 'Binary', 'Octadecimal']
                          .map<DropdownMenuItem<String>>((String value2){
                        return DropdownMenuItem<String>(
                          value: value2,
                          child: Text(value2),
                        );
                      }).toList(),
                    ),
                    TextFormField(decoration: InputDecoration(labelText: "enter code", hintText: "Enter Code Here"), controller: availableCodeController,),
                    ElevatedButton(onPressed: (){
//                  var xz = codeTransformation(availableCodeType, availableCodeController.text, resultType);
                      var vz = codeTransformation(availableCodeType, availableCodeController.text, resultType)
                          .split(',');

                      showDialog(context: context, builder: (BuildContext context){
                        return AlertDialog(
                          alignment: Alignment(0.0,0.0),
                          title: Text(resultType, textAlign: TextAlign.center),
                          content:
                            Text(
                              vz
                                .elementAt(showNeededIndex(resultType))
                                .split(':')
                               // .elementAt(elementLocation(availableCodeController.text, vz)) // try changing above 4 lines to a var then using here and final generation)) //position in column //.elementAt(0)
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', '')
                                .replaceAll('Hex', '')
                                .replaceAll('Binary', '')
                                .replaceAll('Oct', '')
                                .replaceAll('Decimal', '')
                                .replaceAll('ASCII', '')
                                .replaceAll(',', ''), textAlign: TextAlign.center
                            ),
                          actions: <Widget>[
                            ElevatedButton(onPressed: (){ Navigator.of(context).pop();}, child: const Text('OK')),
                          ],);
                      }, );
                    }, child: Text("Convert"),
                    )
                  ],
                ))),
          ),
          ]
        )
    );
  }
  int showNeededIndex(String requiredIndex){
      int x = 0;
      if(requiredIndex == "ASCII"){
        x = 0;
      }
      if(requiredIndex == "Binary"){
        x = 4;
      }
      if(requiredIndex == "Octadecimal"){
        x = 3;
      }
      if(requiredIndex == "Decimal"){
        x = 1;
      }
      if(requiredIndex == "Hexadecimal"){
        x = 2;
      }
      return x;
  }
  //get the position of the available text within the list z is the list of items while the 1st argument is the available code
  int elementLocation(String text, List z) {
    int c = z.indexWhere((element) => element.startsWith(text));
    return c;
  }
}


