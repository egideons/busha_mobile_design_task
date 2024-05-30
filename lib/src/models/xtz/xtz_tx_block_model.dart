class XtzTxBlockModel {
  int cycle;
  int level;
  String hash;
  DateTime timestamp;
  int proto;
  int payloadRound;
  int blockRound;
  int validations;
  int deposit;
  int rewardLiquid;
  int rewardStakedOwn;
  int rewardStakedShared;
  int bonusLiquid;
  int bonusStakedOwn;
  int bonusStakedShared;
  int fees;
  bool nonceRevealed;
  int lbToggleEma;
  int aiToggleEma;
  int reward;
  int bonus;
  int priority;
  bool lbEscapeVote;
  int lbEscapeEma;

  XtzTxBlockModel({
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
    required this.lbToggleEma,
    required this.aiToggleEma,
    required this.reward,
    required this.bonus,
    required this.priority,
    required this.lbEscapeVote,
    required this.lbEscapeEma,
  });

  factory XtzTxBlockModel.fromJson(Map<String, dynamic> json) {
    return XtzTxBlockModel(
      cycle: json['cycle'] ?? 0,
      level: json['level'] ?? 0,
      hash: json['hash'] ?? "",
      timestamp: DateTime.parse(json['timestamp'] ?? ""),
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
      lbToggleEma: json['lbToggleEma'] ?? 0 ?? 0,
      aiToggleEma: json['aiToggleEma'] ?? 0,
      reward: json['reward'] ?? 0,
      bonus: json['bonus'] ?? 0,
      priority: json['priority'] ?? 0,
      lbEscapeVote: json['lbEscapeVote'] ?? false,
      lbEscapeEma: json['lbEscapeEma'] ?? 0,
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
      'lbToggleEma': lbToggleEma,
      'aiToggleEma': aiToggleEma,
      'reward': reward,
      'bonus': bonus,
      'priority': priority,
      'lbEscapeVote': lbEscapeVote,
      'lbEscapeEma': lbEscapeEma,
    };
  }
}
