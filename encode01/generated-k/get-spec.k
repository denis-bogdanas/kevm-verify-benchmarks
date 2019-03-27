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
        <output> _ => #encodeArgs( #bytes( #parseHexWord("0x19") : #parseHexWord("0x1") : #encodeArgs(#bytes32(ARG0), #bytes32(ARG1)) ) ) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063658cc1f614610046575b600080fd5b34801561005257600080fd5b50610083600480360381019080803560001916906020019092919080356000191690602001909291905050506100fe565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156100c35780820151818401526020810190506100a8565b50505050905090810190601f1680156100f05780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b606060197f01000000000000000000000000000000000000000000000000000000000000000260017f010000000000000000000000000000000000000000000000000000000000000002848460405160200180857effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101836000191660001916815260200182600019166000191681526020019450505050506040516020818303038152906040529050929150505600a165627a7a7230582075ad727ec0ae5cccc8219d9844ae6d19679a9983a84dd0000300c5c2d94d97840029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063658cc1f614610046575b600080fd5b34801561005257600080fd5b50610083600480360381019080803560001916906020019092919080356000191690602001909291905050506100fe565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156100c35780820151818401526020810190506100a8565b50505050905090810190601f1680156100f05780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b606060197f01000000000000000000000000000000000000000000000000000000000000000260017f010000000000000000000000000000000000000000000000000000000000000002848460405160200180857effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101836000191660001916815260200182600019166000191681526020019450505050506040516020818303038152906040529050929150505600a165627a7a7230582075ad727ec0ae5cccc8219d9844ae6d19679a9983a84dd0000300c5c2d94d97840029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get", #bytes32(ARG0), #bytes32(ARG1) ) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063658cc1f614610046575b600080fd5b34801561005257600080fd5b50610083600480360381019080803560001916906020019092919080356000191690602001909291905050506100fe565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156100c35780820151818401526020810190506100a8565b50505050905090810190601f1680156100f05780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b606060197f01000000000000000000000000000000000000000000000000000000000000000260017f010000000000000000000000000000000000000000000000000000000000000002848460405160200180857effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101836000191660001916815260200182600019166000191681526020019450505050506040516020818303038152906040529050929150505600a165627a7a7230582075ad727ec0ae5cccc8219d9844ae6d19679a9983a84dd0000300c5c2d94d97840029") </code>
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
andBool #rangeBytes(32, ARG0)
andBool #rangeBytes(32, ARG1)
    ensures true




endmodule

