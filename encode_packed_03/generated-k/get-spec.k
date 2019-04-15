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
        <output> _ => #encodeArgs( #bytes( 25 : 1 : #encodeArgs(#bytes32(ARG0)) ) ) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680638eaa6ac014610046575b600080fd5b34801561005257600080fd5b5061007560048036038101908080356000191690602001909291905050506100f0565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156100b557808201518184015260208101905061009a565b50505050905090810190601f1680156100e25780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b606060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028360405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff191681526001018260001916600019168152602001935050505060405160208183030381529060405290509190505600a165627a7a72305820f45df94cbe57590e36f106852bd88e09c0316b5c9709af6f58c841c9641586ee0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680638eaa6ac014610046575b600080fd5b34801561005257600080fd5b5061007560048036038101908080356000191690602001909291905050506100f0565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156100b557808201518184015260208101905061009a565b50505050905090810190601f1680156100e25780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b606060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028360405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff191681526001018260001916600019168152602001935050505060405160208183030381529060405290509190505600a165627a7a72305820f45df94cbe57590e36f106852bd88e09c0316b5c9709af6f58c841c9641586ee0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get", #bytes32(ARG0) ) </callData> // msg.data
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
            <code> #parseByteStack("608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680638eaa6ac014610046575b600080fd5b34801561005257600080fd5b5061007560048036038101908080356000191690602001909291905050506100f0565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156100b557808201518184015260208101905061009a565b50505050905090810190601f1680156100e25780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b606060197f01000000000000000000000000000000000000000000000000000000000000000260017f0100000000000000000000000000000000000000000000000000000000000000028360405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff191681526001018260001916600019168152602001935050505060405160208183030381529060405290509190505600a165627a7a72305820f45df94cbe57590e36f106852bd88e09c0316b5c9709af6f58c841c9641586ee0029") </code>
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

andBool #rangeUInt(256, CONTRACT_BAL)andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeBytes(32, ARG0)
andBool #rangeBytes(32, ARG1)
    ensures true




endmodule

