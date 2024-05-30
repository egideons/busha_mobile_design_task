class BtcTxModel {
  final String hash;
  final int ver;
  final String prevBlock;
  final String mrklRoot;
  final int time;
  final int bits;
  final List<String> nextBlock;
  final int fee;
  final int nonce;
  final int nTx;
  final int size;
  final int blockIndex;
  final bool mainChain;
  final int height;
  final int weight;
  final List<dynamic> tx;

  BtcTxModel({
    required this.hash,
    required this.ver,
    required this.prevBlock,
    required this.mrklRoot,
    required this.time,
    required this.bits,
    required this.nextBlock,
    required this.fee,
    required this.nonce,
    required this.nTx,
    required this.size,
    required this.blockIndex,
    required this.mainChain,
    required this.height,
    required this.weight,
    required this.tx,
  });

  factory BtcTxModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BtcTxModel(
      hash: json['hash'] ?? "",
      ver: json['ver'] ?? 0,
      prevBlock: json['prev_block'] ?? "",
      mrklRoot: json['mrkl_root'] ?? "",
      time: json['time'] ?? 0,
      bits: json['bits'] ?? 0,
      nextBlock: List<String>.from(json['next_block'] ?? []),
      fee: json['fee'] ?? 0,
      nonce: json['nonce'] ?? 0,
      nTx: json['n_tx'] ?? 0,
      size: json['size'] ?? 0,
      blockIndex: json['block_index'] ?? 0,
      mainChain: json['main_chain'] ?? false,
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      tx: List<dynamic>.from(json['tx'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'ver': ver,
      'prev_block': prevBlock,
      'mrkl_root': mrklRoot,
      'time': time,
      'bits': bits,
      'next_block': nextBlock,
      'fee': fee,
      'nonce': nonce,
      'n_tx': nTx,
      'size': size,
      'block_index': blockIndex,
      'main_chain': mainChain,
      'height': height,
      'weight': weight,
      'tx': tx,
    };
  }
}
