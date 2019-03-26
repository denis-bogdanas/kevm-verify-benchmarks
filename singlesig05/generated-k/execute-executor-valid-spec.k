requires "abstract-semantics.k"
requires "verification.k"

module EXECUTE-EXECUTOR-VALID-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // execute-executor-valid 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => #encodeArgs(#bytes32(TX_INPUT_HASH)) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806313c01cb914610059578063aa5df9e21461012d578063affed0e01461019a575b005b34801561006557600080fd5b5061010f600480360381019080803560ff16906020019092919080356000191690602001909291908035600019169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506101c5565b60405180826000191660001916815260200191505060405180910390f35b34801561013957600080fd5b506101586004803603810190808035906020019092919050505061036b565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156101a657600080fd5b506101af6103a9565b6040518082815260200191505060405180910390f35b6000803373ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff16148061022e5750600073ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff16145b151561023957600080fd5b7f3ee892349ae4bbe61dce18f95115b5dc02daf49204cc602458cd4c1f540d56d7600102888888886040518083838082843782019150509250505060405180910390206000546040516020018086600019166000191681526020018573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018481526020018360001916600019168152602001828152602001955050505050506040516020818303038152906040526040518082805190602001908083835b60208310151561032b5780518252602082019150602081019050602083039250610306565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050809150509998505050505050505050565b60028181548110151561037a57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a723058200d4ca1330a0b693212f1f42866cf044a20a3da6fde4291d8d88c5d557a7de7de0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806313c01cb914610059578063aa5df9e21461012d578063affed0e01461019a575b005b34801561006557600080fd5b5061010f600480360381019080803560ff16906020019092919080356000191690602001909291908035600019169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506101c5565b60405180826000191660001916815260200191505060405180910390f35b34801561013957600080fd5b506101586004803603810190808035906020019092919050505061036b565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156101a657600080fd5b506101af6103a9565b6040518082815260200191505060405180910390f35b6000803373ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff16148061022e5750600073ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff16145b151561023957600080fd5b7f3ee892349ae4bbe61dce18f95115b5dc02daf49204cc602458cd4c1f540d56d7600102888888886040518083838082843782019150509250505060405180910390206000546040516020018086600019166000191681526020018573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018481526020018360001916600019168152602001828152602001955050505050506040516020818303038152906040526040518082805190602001908083835b60208310151561032b5780518252602082019150602081019050602083039250610306565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050809150509998505050505050505050565b60028181548110151561037a57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a723058200d4ca1330a0b693212f1f42866cf044a20a3da6fde4291d8d88c5d557a7de7de0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute",
#uint8(_),
#bytes32(_),
#bytes32(_),
#address(DESTINATION),
#uint256(VALUE),
#bytes(#buf(DATA_LEN, DATA)),
#address(EXECUTOR),
#uint256(GAS_LIMIT) ) </callData> // msg.data
          <callValue> 0 </callValue> // msg.value
          <wordStack> .WordStack => _ </wordStack>
          <localMem> .Map => _ </localMem>
          <pc> 0 => _ </pc>
          <gas> #gas(INITGAS, 0, 0) => _ </gas>
          <memoryUsed> 0 => _ </memoryUsed>
          <previousGas> _ => _ </previousGas>
          <static> false </static> // NOTE: non-static call
          <callDepth> CD </callDepth>
        </callState>
        <substate>
          <selfDestruct> _ </selfDestruct>
          <log> _ </log>
          <refund> _ </refund>
        </substate>
        <gasPrice> _ </gasPrice>
        <origin> _ </origin> // tx.origin
        <previousHash> _ </previousHash>
        <ommersHash> _ </ommersHash>
        <coinbase> _ => _ </coinbase> // block.coinbase
        <stateRoot> _ </stateRoot>
        <transactionsRoot> _ </transactionsRoot>
        <receiptsRoot> _ </receiptsRoot>
        <logsBloom> _ </logsBloom>
        <difficulty> _ </difficulty>
        <number> BLOCK_NUM </number> // block.number
        <gasLimit> _ </gasLimit>
        <gasUsed> _ </gasUsed>
        <timestamp> NOW </timestamp> // now = block.timestamp
        <extraData> _ </extraData>
        <mixHash> _ </mixHash>
        <blockNonce> _ </blockNonce>
        <ommerBlockHeaders> _ </ommerBlockHeaders>
        <blockhash> BLOCK_HASHES </blockhash> // block.blockhash
      </evm>
      <network>
        <activeAccounts> SetItem(#CONTRACT_ID) SetItem(1) _:Set </activeAccounts>
        <accounts>
          <account>
            <acctID> #CONTRACT_ID </acctID>
            <balance> CONTRACT_BAL </balance>
            <code> #parseByteStack("0x608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806313c01cb914610059578063aa5df9e21461012d578063affed0e01461019a575b005b34801561006557600080fd5b5061010f600480360381019080803560ff16906020019092919080356000191690602001909291908035600019169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506101c5565b60405180826000191660001916815260200191505060405180910390f35b34801561013957600080fd5b506101586004803603810190808035906020019092919050505061036b565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156101a657600080fd5b506101af6103a9565b6040518082815260200191505060405180910390f35b6000803373ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff16148061022e5750600073ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff16145b151561023957600080fd5b7f3ee892349ae4bbe61dce18f95115b5dc02daf49204cc602458cd4c1f540d56d7600102888888886040518083838082843782019150509250505060405180910390206000546040516020018086600019166000191681526020018573ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018481526020018360001916600019168152602001828152602001955050505050506040516020818303038152906040526040518082805190602001908083835b60208310151561032b5780518252602082019150602081019050602083039250610306565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050809150509998505050505050505050565b60028181548110151561037a57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a723058200d4ca1330a0b693212f1f42866cf044a20a3da6fde4291d8d88c5d557a7de7de0029") </code>
            <storage>
M
            </storage>
            <origStorage>
_
            </origStorage>
            <nonce> _ </nonce>
          </account>

          <account>
            // precompiled account for ECCREC
            <acctID> 1 </acctID>
            <balance> 0 </balance>
            <code> .WordStack </code>
            <storage> .Map </storage>
            <origStorage> .Map </origStorage>
            <nonce> 0 </nonce>
          </account>


          ...
        </accounts>
        <txOrder> _ </txOrder>
        <txPending> _ </txPending>
        <messages> _ </messages>
      </network>
    </ethereum>
    requires
     #rangeAddress(#CONTRACT_ID)
     andBool #rangeUInt(256, NOW)
     andBool #rangeUInt(128, BLOCK_NUM) // Solidity

     // Account address normality
     andBool #CONTRACT_ID  >Int 0 andBool (notBool #CONTRACT_ID  in #precompiledAccounts(BYZANTIUM))

andBool #rangeUInt(256, CONTRACT_BAL)
andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeAddress(DESTINATION)
andBool #rangeUInt(256, VALUE)
andBool #rangeUInt(256, DATA_LEN)
andBool DATA_LEN <Int 2 ^Int 16
andBool #rangeAddress(EXECUTOR)
andBool #rangeUInt(256, GAS_LIMIT)

andBool select(M, #hashedLocation("Solidity", 3, .IntList)) ==Int DOMAIN_SEPARATOR
andBool #rangeBytes(32, DOMAIN_SEPARATOR)

andBool select(M, #hashedLocation("Solidity", 0, .IntList)) ==Int NONCE
andBool #rangeUInt(256, NONCE)
andBool (EXECUTOR ==Int MSG_SENDER orBool EXECUTOR ==Int 0)
andBool TX_INPUT_HASH ==Int keccak(#encodeArgs(
#bytes32(#parseHexWord("0x3ee892349ae4bbe61dce18f95115b5dc02daf49204cc602458cd4c1f540d56d7")),
#address(DESTINATION),
#uint256(VALUE),
#bytes32(keccak(#buf(DATA_LEN,DATA))),
#uint256(NONCE)
))
    ensures true




endmodule

