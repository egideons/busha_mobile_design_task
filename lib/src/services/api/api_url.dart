class ApiUrl {
  //Bitcoin
  static const getBitcoinLatestBlock = "https://blockchain.info/latestblock";
  static getBitcoinBlockTx(blockHash) =>
      "https://blockchain.info/rawblock/$blockHash";

  //Tezos
  static const getTezosBlocksCount = "https://api.tzkt.io/v1/blocks/count";
  static const getTezosBlocks = "https://api.tzkt.io/v1/blocks";
  static getTezosBlockByHash(hash) => "https://api.tzkt.io/v1/blocks/$hash";
}
