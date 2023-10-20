import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  final _vocabFile = 'aimodel/text_classification_vocab.txt';
  final _modelFile ='aimodel/text_classification.tflite';
  late Interpreter _interpreter;
  // 单句的最大长度
  final int _sentenceLen = 256;

  final String start = '<START>';
  final String pad = '<PAD>';
  final String unk = '<UNKNOWN>';

  late Map<String, int> _dict;


  Classifier() {
    // 当分类器初始化以后加载模型
    _loadModel();
    _loadDictionary();
  }

  void _loadModel() async {

    // 使用 Interpreter.fromAsset 创建解释器
    _interpreter = await Interpreter.fromAsset(_modelFile);
    print('Interpreter loaded successfully');
  }

  void _loadDictionary() async {
    final vocab = await rootBundle.loadString('$_vocabFile');
    var dict = <String, int>{};
    final vocabList = vocab.split('\n');
    for (var i = 0; i < vocabList.length; i++) {
      var entry = vocabList[i].trim().split(' ');
      dict[entry[0]] = int.parse(entry[1]);
    }
    _dict = dict;
    print('Dictionary loaded successfully');
  }

  List<List<int>> tokenizeInputText(String text) {

    // 使用空格进行分词
    final toks = text.split(' ');

    // 创建一个列表，它的长度等于 _sentenceLen，并且使用 <pad> 的对应的字典值来填充
    var vec = List<int>.filled(_sentenceLen, _dict[pad]!.toInt());

    var index = 0;
    if (_dict.containsKey(start)) {
      vec[index++] = _dict[start]!.toInt();
    }

    // 对于句子里的每个单词在 dict 里找到相应的 index 值
    for (var tok in toks) {
      if (index > _sentenceLen) {
        break;
      }
      vec[index++] = _dict.containsKey(tok)
          ? _dict[tok]!.toInt()
          : _dict[unk]!.toInt();
    }


    // 按照我们的解释器输入 tensor 所需的形状 [1,256] 返回 List<List<double>>
    return [vec];
  }

  int classify(String rawText) {
    // tokenizeInputText  返回形状为 [1, 256] 的 List<List<double>>
    List<List<int>> input = tokenizeInputText(rawText);

    //输出形状为 [1, 2] 的矩阵
    var output = <int>[1,2].reshape([1, 2]);

    // run 方法会运行分析并且将结果存储在 output 中。
    _interpreter.run(input, output);

    var result = 0;
    // 如果第一个元素的输出比第二个大，那么当前语句是消极的
   print(output[0][0]);
    print(output[0][1]);
    //print(output[0][1]-output[0][0]);
   // print(result);
    return result;
  }


}