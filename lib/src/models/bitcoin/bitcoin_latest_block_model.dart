class BitCoinLatestBlockModel {
  final String hash;
  final int time;
  final int blockIndex;
  final int height;
  final List<int> txIndexes;

  BitCoinLatestBlockModel({
    required this.hash,
    required this.time,
    required this.blockIndex,
    required this.height,
    required this.txIndexes,
  });

  factory BitCoinLatestBlockModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BitCoinLatestBlockModel(
      hash: json['hash'] ?? "",
      time: json['time'] ?? "",
      blockIndex: json['block_index'],
      height: json['height'],
      txIndexes: List<int>.from(json['txIndexes']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'time': time,
      'block_index': blockIndex,
      'height': height,
      'txIndexes': txIndexes,
    };
  }
}
