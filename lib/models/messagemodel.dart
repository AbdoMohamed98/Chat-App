class Messagemodel {
  final String message;
  Messagemodel({required this.message});

  factory Messagemodel.fromjson( json) {
    return Messagemodel(
      message: (json['text'] ?? '') as String, // fallback to empty
    );
  }
}


