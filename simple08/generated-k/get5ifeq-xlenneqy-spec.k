requires "abstract-semantics.k"
requires "verification.k"

module GET5IFEQ-XLENNEQY-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // get5ifeq-xlenneqy 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680631e7784a014604e578063a56dfe4a14609a575b600080fd5b348015605957600080fd5b50608460048036038101908080359060200190820180359060200191909192939192939050505060c2565b6040518082815260200191505060405180910390f35b34801560a557600080fd5b5060ac60df565b6040518082815260200191505060405180910390f35b600080548383905014151560d557600080fd5b6005905092915050565b600054815600a165627a7a72305820cfa737757dd32ec4e99703e375c1d40233618a2cf63dc471fdacb1cf7d3b15a90029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680631e7784a014604e578063a56dfe4a14609a575b600080fd5b348015605957600080fd5b50608460048036038101908080359060200190820180359060200191909192939192939050505060c2565b6040518082815260200191505060405180910390f35b34801560a557600080fd5b5060ac60df565b6040518082815260200191505060405180910390f35b600080548383905014151560d557600080fd5b6005905092915050565b600054815600a165627a7a72305820cfa737757dd32ec4e99703e375c1d40233618a2cf63dc471fdacb1cf7d3b15a90029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get5ifeq", #array(#uint256(_), XARR_LEN, _)) </callData> // msg.data
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
            <code> #parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680631e7784a014604e578063a56dfe4a14609a575b600080fd5b348015605957600080fd5b50608460048036038101908080359060200190820180359060200191909192939192939050505060c2565b6040518082815260200191505060405180910390f35b34801560a557600080fd5b5060ac60df565b6040518082815260200191505060405180910390f35b600080548383905014151560d557600080fd5b6005905092915050565b600054815600a165627a7a72305820cfa737757dd32ec4e99703e375c1d40233618a2cf63dc471fdacb1cf7d3b15a90029") </code>
            <storage>
S
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

andBool #rangeUInt(256, CONTRACT_BAL)andBool Y ==Int select(S, #hashedLocation("Solidity", 0, .IntList))
andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, XARR_LEN)
andBool #rangeUInt(256, Y)andBool XARR_LEN =/=Int Y
    ensures true




endmodule

