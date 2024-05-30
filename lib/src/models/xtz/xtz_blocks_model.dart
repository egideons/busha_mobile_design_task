class TezosBlockModel {
  final int cycle;
  final int level;
  final String hash;
  final String timestamp;
  final int proto;
  final int payloadRound;
  final int blockRound;
  final int validations;
  final int deposit;
  final int rewardLiquid;
  final int rewardStakedOwn;
  final int rewardStakedShared;
  final int bonusLiquid;
  final int bonusStakedOwn;
  final int bonusStakedShared;
  final int fees;
  final bool nonceRevealed;

  TezosBlockModel({
    required this.cycle,
    required this.level,
    required this.hash,
    required this.timestamp,
    required this.proto,
    required this.payloadRound,
    required this.blockRound,
    required this.validations,
    required this.deposit,
    required this.rewardLiquid,
    required this.rewardStakedOwn,
    required this.rewardStakedShared,
    required this.bonusLiquid,
    required this.bonusStakedOwn,
    required this.bonusStakedShared,
    required this.fees,
    required this.nonceRevealed,
  });

  factory TezosBlockModel.fromJson(Map<String, dynamic>? json) {
    json = {};
    return TezosBlockModel(
      cycle: json['cycle'] ?? 0,
      level: json['level'] ?? 0,
      hash: json['hash'] ?? "",
      timestamp: json['timestamp'] ?? "",
      proto: json['proto'] ?? 0,
      payloadRound: json['payloadRound'] ?? 0,
      blockRound: json['blockRound'] ?? 0,
      validations: json['validations'] ?? 0,
      deposit: json['deposit'] ?? 0,
      rewardLiquid: json['rewardLiquid'] ?? 0,
      rewardStakedOwn: json['rewardStakedOwn'] ?? 0,
      rewardStakedShared: json['rewardStakedShared'] ?? 0,
      bonusLiquid: json['bonusLiquid'] ?? 0,
      bonusStakedOwn: json['bonusStakedOwn'] ?? 0,
      bonusStakedShared: json['bonusStakedShared'] ?? 0,
      fees: json['fees'] ?? 0,
      nonceRevealed: json['nonceRevealed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cycle': cycle,
      'level': level,
      'hash': hash,
      'timestamp': timestamp,
      'proto': proto,
      'payloadRound': payloadRound,
      'blockRound': blockRound,
      'validations': validations,
      'deposit': deposit,
      'rewardLiquid': rewardLiquid,
      'rewardStakedOwn': rewardStakedOwn,
      'rewardStakedShared': rewardStakedShared,
      'bonusLiquid': bonusLiquid,
      'bonusStakedOwn': bonusStakedOwn,
      'bonusStakedShared': bonusStakedShared,
      'fees': fees,
      'nonceRevealed': nonceRevealed,
    };
  }
}
