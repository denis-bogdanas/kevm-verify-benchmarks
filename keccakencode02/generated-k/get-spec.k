requires "abstract-semantics.k"
requires "verification.k"

module GET-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // get 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => #encodeArgs(#bytes32(keccak(#encodeArgs(#uint256(X))))) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680639507d39a14610046575b600080fd5b34801561005257600080fd5b506100716004803603810190808035906020019092919050505061008f565b60405180826000191660001916815260200191505060405180910390f35b600081604051602001808281526020019150506040516020818303038152906040526040518082805190602001908083835b6020831015156100e657805182526020820191506020810190506020830392506100c1565b6001836020036101000a038019825116818451168082178552505050505050905001915050604051809103902090509190505600a165627a7a7230582025d2052c2f695b4d82e7cae97bbe4a47739c04ec1cdf1eec0198666e087fd0f50029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680639507d39a14610046575b600080fd5b34801561005257600080fd5b506100716004803603810190808035906020019092919050505061008f565b60405180826000191660001916815260200191505060405180910390f35b600081604051602001808281526020019150506040516020818303038152906040526040518082805190602001908083835b6020831015156100e657805182526020820191506020810190506020830392506100c1565b6001836020036101000a038019825116818451168082178552505050505050905001915050604051809103902090509190505600a165627a7a7230582025d2052c2f695b4d82e7cae97bbe4a47739c04ec1cdf1eec0198666e087fd0f50029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get", #uint256(X) ) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680639507d39a14610046575b600080fd5b34801561005257600080fd5b506100716004803603810190808035906020019092919050505061008f565b60405180826000191660001916815260200191505060405180910390f35b600081604051602001808281526020019150506040516020818303038152906040526040518082805190602001908083835b6020831015156100e657805182526020820191506020810190506020830392506100c1565b6001836020036101000a038019825116818451168082178552505050505050905001915050604051809103902090509190505600a165627a7a7230582025d2052c2f695b4d82e7cae97bbe4a47739c04ec1cdf1eec0198666e087fd0f50029") </code>
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

andBool #rangeUInt(256, CONTRACT_BAL)andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, X)
    ensures true




endmodule

