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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063ab5898e814610046575b600080fd5b34801561005257600080fd5b50610089600480360381019080803590602001908201803590602001919091929391929390803590602001909291905050506100a7565b60405180826000191660001916815260200191505060405180910390f35b6000806000858560405180838380828437820191505092505050604051809103902084604051602001808360001916600019168152602001828152602001925050506040516020818303038152906040526040518082805190602001908083835b60208310151561012d5780518252602082019150602081019050602083039250610108565b6001836020036101000a0380198251168184511680821785525050505050509050019150506040518091039020915060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028360405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101826000191660001916815260200193505050506040516020818303038152906040526040518082805190602001908083835b6020831015156102975780518252602082019150602081019050602083039250610272565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050809250505093925050505600a165627a7a723058204da8e81a752d8cf8acb2331fa69ae994b9af47a88c917e498348b7e0017b0f1d0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063ab5898e814610046575b600080fd5b34801561005257600080fd5b50610089600480360381019080803590602001908201803590602001919091929391929390803590602001909291905050506100a7565b60405180826000191660001916815260200191505060405180910390f35b6000806000858560405180838380828437820191505092505050604051809103902084604051602001808360001916600019168152602001828152602001925050506040516020818303038152906040526040518082805190602001908083835b60208310151561012d5780518252602082019150602081019050602083039250610108565b6001836020036101000a0380198251168184511680821785525050505050509050019150506040518091039020915060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028360405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101826000191660001916815260200193505050506040516020818303038152906040526040518082805190602001908083835b6020831015156102975780518252602082019150602081019050602083039250610272565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050809250505093925050505600a165627a7a723058204da8e81a752d8cf8acb2331fa69ae994b9af47a88c917e498348b7e0017b0f1d0029") </programBytes>
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
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063ab5898e814610046575b600080fd5b34801561005257600080fd5b50610089600480360381019080803590602001908201803590602001919091929391929390803590602001909291905050506100a7565b60405180826000191660001916815260200191505060405180910390f35b6000806000858560405180838380828437820191505092505050604051809103902084604051602001808360001916600019168152602001828152602001925050506040516020818303038152906040526040518082805190602001908083835b60208310151561012d5780518252602082019150602081019050602083039250610108565b6001836020036101000a0380198251168184511680821785525050505050509050019150506040518091039020915060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028360405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101826000191660001916815260200193505050506040516020818303038152906040526040518082805190602001908083835b6020831015156102975780518252602082019150602081019050602083039250610272565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050809250505093925050505600a165627a7a723058204da8e81a752d8cf8acb2331fa69ae994b9af47a88c917e498348b7e0017b0f1d0029") </code>
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

