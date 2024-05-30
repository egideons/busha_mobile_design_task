class BtcTxModel {
  final String hash;
  final int ver;
  final int vinSz;
  final int voutSz;
  final int size;
  final int weight;
  final int fee;
  final String relayedBy;
  final int lockTime;
  final int txIndex;
  final bool doubleSpend;
  final int time;
  final int blockIndex;
  final int blockHeight;
  final List<BtcTxInput> inputs;
  final List<BtcTxOutput> out;

  BtcTxModel({
    required this.hash,
    required this.ver,
    required this.vinSz,
    required this.voutSz,
    required this.size,
    required this.weight,
    required this.fee,
    required this.relayedBy,
    required this.lockTime,
    required this.txIndex,
    required this.doubleSpend,
    required this.time,
    required this.blockIndex,
    required this.blockHeight,
    required this.inputs,
    required this.out,
  });

  factory BtcTxModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BtcTxModel(
      hash: json['hash'] ?? "",
      ver: json['ver'] ?? 0,
      vinSz: json['vin_sz'] ?? 0,
      voutSz: json['vout_sz'] ?? 0,
      size: json['size'] ?? 0,
      weight: json['weight'] ?? 0,
      fee: json['fee'] ?? 0,
      relayedBy: json['relayed_by'] ?? "",
      lockTime: json['lock_time'] ?? 0,
      txIndex: json['tx_index'] ?? 0,
      doubleSpend: json['double_spend'] ?? false,
      time: json['time'] ?? 0,
      blockIndex: json['block_index'],
      blockHeight: json['block_height'],
      inputs: (json['inputs'] as List<dynamic>? ?? [])
          .map((item) => BtcTxInput.fromJson(item))
          .toList(),
      // (json['inputs'] as List).map((i) => BtcTxInput.fromJson(i)).toList(),
      out: (json['inputs'] as List<dynamic>? ?? [])
          .map((item) => BtcTxOutput.fromJson(item))
          .toList(),
      // (json['out'] as List).map((o) => BtcTxOutput.fromJson(o)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'ver': ver,
      'vin_sz': vinSz,
      'vout_sz': voutSz,
      'size': size,
      'weight': weight,
      'fee': fee,
      'relayed_by': relayedBy,
      'lock_time': lockTime,
      'tx_index': txIndex,
      'double_spend': doubleSpend,
      'time': time,
      'block_index': blockIndex,
      'block_height': blockHeight,
      'inputs': inputs.map((i) => i.toJson()).toList(),
      'out': out.map((o) => o.toJson()).toList(),
    };
  }
}

class BtcTxInput {
  final int sequence;
  final String witness;
  final String script;
  final int index;
  final BtcTxPrevOut prevOut;

  BtcTxInput({
    required this.sequence,
    required this.witness,
    required this.script,
    required this.index,
    required this.prevOut,
  });

  factory BtcTxInput.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BtcTxInput(
      sequence: json['sequence'] ?? 0,
      witness: json['witness'] ?? "",
      script: json['script'] ?? "",
      index: json['index'] ?? 0,
      prevOut: BtcTxPrevOut.fromJson(json['prev_out'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sequence': sequence,
      'witness': witness,
      'script': script,
      'index': index,
      'prev_out': prevOut.toJson(),
    };
  }
}

class BtcTxPrevOut {
  final int type;
  final bool spent;
  final int value;
  final List<BtcTxSpendingOutPoint> spendingOutpoints;
  final int n;
  final int txIndex;
  final String script;
  final String addr;

  BtcTxPrevOut({
    required this.type,
    required this.spent,
    required this.value,
    required this.spendingOutpoints,
    required this.n,
    required this.txIndex,
    required this.script,
    required this.addr,
  });

  factory BtcTxPrevOut.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BtcTxPrevOut(
      type: json['type'] ?? 0,
      spent: json['spent'] ?? false,
      value: json['value'] ?? 0,
      spendingOutpoints: (json['spending_outpoints'] as List<dynamic>? ?? [])
          .map((e) => BtcTxSpendingOutPoint.fromJson(e))
          .toList(),
      n: json['n'] ?? 0,
      txIndex: json['tx_index'] ?? 0,
      script: json['script'] ?? "",
      addr: json['addr'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'spent': spent,
      'value': value,
      'spending_outpoints': spendingOutpoints.map((e) => e.toJson()).toList(),
      'n': n,
      'tx_index': txIndex,
      'script': script,
      'addr': addr,
    };
  }
}

class BtcTxSpendingOutPoint {
  final int txIndex;
  final int n;

  BtcTxSpendingOutPoint({
    required this.txIndex,
    required this.n,
  });

  factory BtcTxSpendingOutPoint.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BtcTxSpendingOutPoint(
      txIndex: json['tx_index'] ?? 0,
      n: json['n'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tx_index': txIndex,
      'n': n,
    };
  }
}

class BtcTxOutput {
  final int type;
  final bool spent;
  final int value;
  final List<BtcTxSpendingOutPoint> spendingOutpoints;
  final int n;
  final int txIndex;
  final String script;
  final String addr;

  BtcTxOutput({
    required this.type,
    required this.spent,
    required this.value,
    required this.spendingOutpoints,
    required this.n,
    required this.txIndex,
    required this.script,
    required this.addr,
  });

  factory BtcTxOutput.fromJson(Map<String, dynamic>? json) {
    json ??= {};
    return BtcTxOutput(
      type: json['type'] ?? 0,
      spent: json['spent'] ?? false,
      value: json['value'] ?? 0,
      spendingOutpoints: (json['spending_outpoints'] as List<dynamic>? ?? [])
          .map((e) => BtcTxSpendingOutPoint.fromJson(e))
          .toList(),
      n: json['n'] ?? 0,
      txIndex: json['tx_index'] ?? 0,
      script: json['script'] ?? "",
      addr: json['addr'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'spent': spent,
      'value': value,
      'spending_outpoints': spendingOutpoints.map((e) => e.toJson()).toList(),
      'n': n,
      'tx_index': txIndex,
      'script': script,
      'addr': addr,
    };
  }
}
