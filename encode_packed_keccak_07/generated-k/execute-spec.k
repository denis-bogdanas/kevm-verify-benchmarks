requires "abstract-semantics.k"
requires "verification.k"

module EXECUTE-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // execute 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => #encodeArgs(#bytes32(TX_TOTAL_HASH)) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063ab5898e814610046575b600080fd5b34801561005257600080fd5b506100d46004803603604081101561006957600080fd5b810190808035906020019064010000000081111561008657600080fd5b82018360208201111561009857600080fd5b803590602001918460018302840111640100000000831117156100ba57600080fd5b9091929391929390803590602001909291905050506100ea565b6040518082815260200191505060405180910390f35b6000808484604051808383808284378083019250505092505050604051809103902083604051602001808381526020018281526020019250505060405160208183030381529060405280519060200120905060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028260405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101828152602001935050505060405160208183030381529060405280519060200120915050939250505056fea165627a7a723058209f90e99606038cb5a197b59d4a8c03926464b7c2c81bd323e38a078ff446f1260029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063ab5898e814610046575b600080fd5b34801561005257600080fd5b506100d46004803603604081101561006957600080fd5b810190808035906020019064010000000081111561008657600080fd5b82018360208201111561009857600080fd5b803590602001918460018302840111640100000000831117156100ba57600080fd5b9091929391929390803590602001909291905050506100ea565b6040518082815260200191505060405180910390f35b6000808484604051808383808284378083019250505092505050604051809103902083604051602001808381526020018281526020019250505060405160208183030381529060405280519060200120905060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028260405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101828152602001935050505060405160208183030381529060405280519060200120915050939250505056fea165627a7a723058209f90e99606038cb5a197b59d4a8c03926464b7c2c81bd323e38a078ff446f1260029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute",
#bytes(#buf(DATA_LEN, DATA)),
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
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063ab5898e814610046575b600080fd5b34801561005257600080fd5b506100d46004803603604081101561006957600080fd5b810190808035906020019064010000000081111561008657600080fd5b82018360208201111561009857600080fd5b803590602001918460018302840111640100000000831117156100ba57600080fd5b9091929391929390803590602001909291905050506100ea565b6040518082815260200191505060405180910390f35b6000808484604051808383808284378083019250505092505050604051809103902083604051602001808381526020018281526020019250505060405160208183030381529060405280519060200120905060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028260405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101828152602001935050505060405160208183030381529060405280519060200120915050939250505056fea165627a7a723058209f90e99606038cb5a197b59d4a8c03926464b7c2c81bd323e38a078ff446f1260029") </code>
            <storage>
M
            </storage>
            <origStorage>
_
            </origStorage>
            <nonce> _ </nonce>
          </account>

          <account>
            <acctID> #CALLEE_ID </acctID>
            <balance> CALLEE_BAL </balance>
            <code> _ </code>
            <storage>
                _
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
     andBool #rangeAddress(#CALLEE_ID)
     andBool #rangeUInt(256, NOW)
     andBool #rangeUInt(128, BLOCK_NUM) // Solidity

     // Account address normality
     andBool #CONTRACT_ID  >Int 0 andBool (notBool #CONTRACT_ID  in #precompiledAccounts(BYZANTIUM))
     andBool #CALLEE_ID  >Int 0 andBool (notBool #CALLEE_ID  in #precompiledAccounts(BYZANTIUM))

andBool #rangeUInt(256, CONTRACT_BAL)
andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, DATA_LEN)
andBool DATA_LEN <Int 2 ^Int 16
andBool #rangeUInt(256, GAS_LIMIT)

andBool TX_INPUT_HASH ==Int keccak(#encodeArgs(
#bytes32(keccak(#buf(DATA_LEN,DATA))),
#uint256(GAS_LIMIT)))

andBool TX_TOTAL_HASH ==Int keccak(25 : 1 : #encodeArgs(
#bytes32(TX_INPUT_HASH)
))
    ensures true




endmodule

