import 'dart:io';

class DocumentModel {
  String img_url;
  String documentType;
  String documentNo;
  String id;

  DocumentModel({
    required this.img_url,
    required this.documentNo,
    required this.documentType,
    required this.id,
  });
}

class DocumentData {
  final String documentType;
  final String documentNo;
  final List<File> files;

  DocumentData({
    required this.documentType,
    required this.documentNo,
    required this.files,
  });
}
