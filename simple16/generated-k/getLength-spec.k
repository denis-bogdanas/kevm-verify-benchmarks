requires "abstract-semantics.k"
requires "verification.k"

module GETLENGTH-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // getLength 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => #encodeArgs(#uint256(X_LEN)) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063734628d7146044575b600080fd5b348015604f57600080fd5b50609260048036038101908080359060200190820180359060200191909192939192939080359060200190820180359060200191909192939192939050505060a8565b6040518082815260200191505060405180910390f35b60008484905090509493505050505600a165627a7a723058207af820d3e8b3a0df3b86a1708ba9b3c9e8120fa2180723da6b20b06fee0a4e4e0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063734628d7146044575b600080fd5b348015604f57600080fd5b50609260048036038101908080359060200190820180359060200191909192939192939080359060200190820180359060200191909192939192939050505060a8565b6040518082815260200191505060405180910390f35b60008484905090509493505050505600a165627a7a723058207af820d3e8b3a0df3b86a1708ba9b3c9e8120fa2180723da6b20b06fee0a4e4e0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("getLength", #array(#uint256(_), X_LEN, _), #array(#uint256(_), Z_LEN, _)) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063734628d7146044575b600080fd5b348015604f57600080fd5b50609260048036038101908080359060200190820180359060200191909192939192939080359060200190820180359060200191909192939192939050505060a8565b6040518082815260200191505060405180910390f35b60008484905090509493505050505600a165627a7a723058207af820d3e8b3a0df3b86a1708ba9b3c9e8120fa2180723da6b20b06fee0a4e4e0029") </code>
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
     andBool #rangeUInt(256, NOW)
     andBool #rangeUInt(128, BLOCK_NUM) // Solidity

     // Account address normality
     andBool #CONTRACT_ID  >Int 0 andBool (notBool #CONTRACT_ID  in #precompiledAccounts(BYZANTIUM))

andBool #rangeUInt(256, CONTRACT_BAL)andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, X_LEN)
andBool #rangeUInt(256, Z_LEN)
    ensures true




endmodule

