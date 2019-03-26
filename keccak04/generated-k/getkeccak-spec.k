requires "abstract-semantics.k"
requires "verification.k"

module GETKECCAK-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // getkeccak 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => #encodeArgs(#bytes32(HASH)) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806347f13aa514610051578063affed0e014610084575b600080fd5b34801561005d57600080fd5b506100666100af565b60405180826000191660001916815260200191505060405180910390f35b34801561009057600080fd5b50610099610218565b6040518082815260200191505060405180910390f35b600060197f01000000000000000000000000000000000000000000000000000000000000000260017f01000000000000000000000000000000000000000000000000000000000000000260005460405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1916815260010182815260200193505050506040516020818303038152906040526040518082805190602001908083835b6020831015156101e657805182526020820191506020810190506020830392506101c1565b6001836020036101000a0380198251168184511680821785525050505050509050019150506040518091039020905090565b600054815600a165627a7a72305820379f6ccd7d82b487d25adbd8dfb94cc0db2619b10fd711a1852b60c19df454550029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806347f13aa514610051578063affed0e014610084575b600080fd5b34801561005d57600080fd5b506100666100af565b60405180826000191660001916815260200191505060405180910390f35b34801561009057600080fd5b50610099610218565b6040518082815260200191505060405180910390f35b600060197f01000000000000000000000000000000000000000000000000000000000000000260017f01000000000000000000000000000000000000000000000000000000000000000260005460405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1916815260010182815260200193505050506040516020818303038152906040526040518082805190602001908083835b6020831015156101e657805182526020820191506020810190506020830392506101c1565b6001836020036101000a0380198251168184511680821785525050505050509050019150506040518091039020905090565b600054815600a165627a7a72305820379f6ccd7d82b487d25adbd8dfb94cc0db2619b10fd711a1852b60c19df454550029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("getkeccak", .TypedArgs ) </callData> // msg.data
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
            <code> #parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806347f13aa514610051578063affed0e014610084575b600080fd5b34801561005d57600080fd5b506100666100af565b60405180826000191660001916815260200191505060405180910390f35b34801561009057600080fd5b50610099610218565b6040518082815260200191505060405180910390f35b600060197f01000000000000000000000000000000000000000000000000000000000000000260017f01000000000000000000000000000000000000000000000000000000000000000260005460405160200180847effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19168152600101837effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff19167effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1916815260010182815260200193505050506040516020818303038152906040526040518082805190602001908083835b6020831015156101e657805182526020820191506020810190506020830392506101c1565b6001836020036101000a0380198251168184511680821785525050505050509050019150506040518091039020905090565b600054815600a165627a7a72305820379f6ccd7d82b487d25adbd8dfb94cc0db2619b10fd711a1852b60c19df454550029") </code>
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
andBool select(M, #hashedLocation("Solidity", 0, .IntList)) ==Int NONCE
andBool #rangeUInt(256, NONCE)
andBool HASH ==Int keccak(25 : 1 : #encodeArgs(#uint256(NONCE)))
    ensures true




endmodule

