import '../../product/enum/image_paths.dart';

extension ImagePathExtension on ImagePaths{
  String toSvgPath(){
    return 'assets/images/$name.svg';
  }
  String toPngPath(){
    return 'assets/images/$name.png';
  }
  String toJpgPath(){
    return 'assets/images/$name.jpg';
  }
  String toGifPath(){
    return 'assets/images/$name.gif';
  }
}

