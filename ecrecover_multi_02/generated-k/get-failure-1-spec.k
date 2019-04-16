requires "abstract-semantics.k"
requires "verification.k"

module GET-FAILURE-1-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // get-failure-1 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680636b3a9f6114610046575b600080fd5b34801561005257600080fd5b506101026004803603810190808035600019169060200190929190806060019060038060200260405190810160405280929190826003602002808284378201915050505050919291929080606001906003806020026040519081016040528092919082600360200280828437820191505050505091929192908060600190600380602002604051908101604052809291908260036020028082843782019150505050509192919290505050610118565b6040518082815260200191505060405180910390f35b60008060008091505b600382101561021557600187878460038110151561013b57fe5b6020020151878560038110151561014e57fe5b6020020151878660038110151561016157fe5b6020020151604051600081526020016040526040518085600019166000191681526020018460ff1660ff1681526020018360001916600019168152602001826000191660001916815260200194505050505060206040516020810390808403906000865af11580156101d7573d6000803e3d6000fd5b50505060206040510351905060008173ffffffffffffffffffffffffffffffffffffffff1611151561020857600080fd5b8180600101925050610121565b6005925050509493505050505600a165627a7a72305820a26fc255da29689ae4aedcc2c975d40c54bb2a08e34a93207fb36fd3b9d9e7050029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680636b3a9f6114610046575b600080fd5b34801561005257600080fd5b506101026004803603810190808035600019169060200190929190806060019060038060200260405190810160405280929190826003602002808284378201915050505050919291929080606001906003806020026040519081016040528092919082600360200280828437820191505050505091929192908060600190600380602002604051908101604052809291908260036020028082843782019150505050509192919290505050610118565b6040518082815260200191505060405180910390f35b60008060008091505b600382101561021557600187878460038110151561013b57fe5b6020020151878560038110151561014e57fe5b6020020151878660038110151561016157fe5b6020020151604051600081526020016040526040518085600019166000191681526020018460ff1660ff1681526020018360001916600019168152602001826000191660001916815260200194505050505060206040516020810390808403906000865af11580156101d7573d6000803e3d6000fd5b50505060206040510351905060008173ffffffffffffffffffffffffffffffffffffffff1611151561020857600080fd5b8180600101925050610121565b6005925050509493505050505600a165627a7a72305820a26fc255da29689ae4aedcc2c975d40c54bb2a08e34a93207fb36fd3b9d9e7050029") </programBytes>
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
        <activeAccounts> SetItem(#CONTRACT_ID) SetItem(1) _:Set </activeAccounts>
        <accounts>
          <account>
            <acctID> #CONTRACT_ID </acctID>
            <balance> CONTRACT_BAL </balance>
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680636b3a9f6114610046575b600080fd5b34801561005257600080fd5b506101026004803603810190808035600019169060200190929190806060019060038060200260405190810160405280929190826003602002808284378201915050505050919291929080606001906003806020026040519081016040528092919082600360200280828437820191505050505091929192908060600190600380602002604051908101604052809291908260036020028082843782019150505050509192919290505050610118565b6040518082815260200191505060405180910390f35b60008060008091505b600382101561021557600187878460038110151561013b57fe5b6020020151878560038110151561014e57fe5b6020020151878660038110151561016157fe5b6020020151604051600081526020016040526040518085600019166000191681526020018460ff1660ff1681526020018360001916600019168152602001826000191660001916815260200194505050505060206040516020810390808403906000865af11580156101d7573d6000803e3d6000fd5b50505060206040510351905060008173ffffffffffffffffffffffffffffffffffffffff1611151561020857600080fd5b8180600101925050610121565b6005925050509493505050505600a165627a7a72305820a26fc255da29689ae4aedcc2c975d40c54bb2a08e34a93207fb36fd3b9d9e7050029") </code>
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
andBool #ecrecEmpty( ECREC_DATA1 )
    ensures true




endmodule

