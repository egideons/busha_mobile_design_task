class BitCoinLatestBlockModel {
  final String hash;
  final int time;
  final int blockIndex;
  final int height;
  final List<dynamic> txIndexes;

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
      time: json['time'] ?? 0,
      blockIndex: json['block_index'] ?? 0,
      height: json['height'] ?? 0,
      txIndexes: json['txIndexes'] ?? [],
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
