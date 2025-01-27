import 'dart:convert';
import 'dart:typed_data';

class Note {
  final String title;
  final String text;
  final String created;
  final List<Uint8List> images;

  Note(
      {required this.title,
      required this.text,
      required this.images,
      required this.created});



  @override
  String toString() {
    return 'Note(title: $title, text: $text, images: ${images.length}, created: $created)';
  }

  // Convert Note to Map
  Map<String, Object?> toMap() {
    return {
      'title': title,
      'text': text,
      'created': created,
      'images': jsonEncode(images.map((image) => base64Encode(image)).toList()),
      // Serialize images
    };
  }

  // Convert Map to Note
  factory Note.fromMap(Map<String, Object?> map) {
    return Note(
      title: map['title'] as String,
      created: map['created'] as String,
      text: map['text'] as String,
      images: (jsonDecode(map['images'] as String) as List<dynamic>)
          .map((image) => base64Decode(image as String))
          .toList(),
    );
  }
}
