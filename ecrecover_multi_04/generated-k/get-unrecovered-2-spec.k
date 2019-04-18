requires "abstract-semantics.k"
requires "verification.k"

module GET-UNRECOVERED-2-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // get-unrecovered-2 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => _ </output>
        <statusCode> _ => EVMC_REVERT </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680636b3a9f6114610046575b600080fd5b34801561005257600080fd5b50610143600480360361014081101561006a57600080fd5b810190808035906020019092919080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f8201169050808301925050505050509192919290505050610159565b6040518082815260200191505060405180910390f35b6000806000905060008090505b60038110156102af576000600188888460038110151561018257fe5b6020020151888560038110151561019557fe5b602002015188866003811015156101a857fe5b602002015160405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610204573d6000803e3d6000fd5b5050506020604051035190508273ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611801561029357506000808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060009054906101000a900460ff165b151561029e57600080fd5b809250508080600101915050610166565b50600591505094935050505056fea165627a7a7230582024fa8f0069e870e0af42e7c1d2031a5b13e373e7b2e7f79a218e3d3d386c29940029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680636b3a9f6114610046575b600080fd5b34801561005257600080fd5b50610143600480360361014081101561006a57600080fd5b810190808035906020019092919080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f8201169050808301925050505050509192919290505050610159565b6040518082815260200191505060405180910390f35b6000806000905060008090505b60038110156102af576000600188888460038110151561018257fe5b6020020151888560038110151561019557fe5b602002015188866003811015156101a857fe5b602002015160405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610204573d6000803e3d6000fd5b5050506020604051035190508273ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611801561029357506000808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060009054906101000a900460ff165b151561029e57600080fd5b809250508080600101915050610166565b50600591505094935050505056fea165627a7a7230582024fa8f0069e870e0af42e7c1d2031a5b13e373e7b2e7f79a218e3d3d386c29940029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get", #bytes32(HASH), #staticarray1(#uint8(_), 3, #uint8(SIGV0), #uint8(SIGV1), #uint8(SIGV2)),
#staticarray1(#bytes32(_), 3, #bytes32(SIGR0), #bytes32(SIGR1), #bytes32(SIGR2)),
#staticarray1(#bytes32(_), 3, #bytes32(SIGS0), #bytes32(SIGS1), #bytes32(SIGS2))) </callData> // msg.data
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
        <activeAccounts> SetItem(#CONTRACT_ID) SetItem(#CALLEE_ID) SetItem(1) _:Set </activeAccounts>
        <accounts>
          <account>
            <acctID> #CONTRACT_ID </acctID>
            <balance> CONTRACT_BAL </balance>
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680636b3a9f6114610046575b600080fd5b34801561005257600080fd5b50610143600480360361014081101561006a57600080fd5b810190808035906020019092919080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f8201169050808301925050505050509192919290505050610159565b6040518082815260200191505060405180910390f35b6000806000905060008090505b60038110156102af576000600188888460038110151561018257fe5b6020020151888560038110151561019557fe5b602002015188866003811015156101a857fe5b602002015160405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610204573d6000803e3d6000fd5b5050506020604051035190508273ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611801561029357506000808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200190815260200160002060009054906101000a900460ff165b151561029e57600080fd5b809250508080600101915050610166565b50600591505094935050505056fea165627a7a7230582024fa8f0069e870e0af42e7c1d2031a5b13e373e7b2e7f79a218e3d3d386c29940029") </code>
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
andBool #rangeBytes(32, HASH)
andBool #rangeUInt(8, SIGV0)
andBool #rangeUInt(8, SIGV1)
andBool #rangeUInt(8, SIGV2)
andBool #rangeBytes(32, SIGR0)
andBool #rangeBytes(32, SIGR1)
andBool #rangeBytes(32, SIGR2)
andBool #rangeBytes(32, SIGS0)
andBool #rangeBytes(32, SIGS1)
andBool #rangeBytes(32, SIGS2)

andBool ECREC_DATA0 ==K #encodeArgs( #bytes32(HASH), #uint8(SIGV0), #bytes32(SIGR0), #bytes32(SIGS0) )
andBool ECREC_DATA1 ==K #encodeArgs( #bytes32(HASH), #uint8(SIGV1), #bytes32(SIGR1), #bytes32(SIGS1) )
andBool ECREC_DATA2 ==K #encodeArgs( #bytes32(HASH), #uint8(SIGV2), #bytes32(SIGR2), #bytes32(SIGS2) )
andBool #ecrecEmpty( ECREC_DATA2 )
    ensures true




endmodule

