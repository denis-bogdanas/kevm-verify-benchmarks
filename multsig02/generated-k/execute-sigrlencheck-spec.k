requires "abstract-semantics.k"
requires "verification.k"

module EXECUTE-SIGRLENCHECK-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // execute-sigrlencheck 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e814604e5780638af7c649146076575b600080fd5b348015605957600080fd5b50606060c2565b6040518082815260200191505060405180910390f35b348015608157600080fd5b5060ac60048036038101908080359060200190820180359060200191909192939192939050505060c8565b6040518082815260200191505060405180910390f35b60005481565b600080548383905014151560db57600080fd5b60059050929150505600a165627a7a723058203565f7d82691714e912c285f18c087dee993d1ff62adef611e08f472ad297db40029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e814604e5780638af7c649146076575b600080fd5b348015605957600080fd5b50606060c2565b6040518082815260200191505060405180910390f35b348015608157600080fd5b5060ac60048036038101908080359060200190820180359060200191909192939192939050505060c8565b6040518082815260200191505060405180910390f35b60005481565b600080548383905014151560db57600080fd5b60059050929150505600a165627a7a723058203565f7d82691714e912c285f18c087dee993d1ff62adef611e08f472ad297db40029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute", #array(#uint8(_), SIGV_LEN, _)) </callData> // msg.data
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
            <code> #parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e814604e5780638af7c649146076575b600080fd5b348015605957600080fd5b50606060c2565b6040518082815260200191505060405180910390f35b348015608157600080fd5b5060ac60048036038101908080359060200190820180359060200191909192939192939050505060c8565b6040518082815260200191505060405180910390f35b60005481565b600080548383905014151560db57600080fd5b60059050929150505600a165627a7a723058203565f7d82691714e912c285f18c087dee993d1ff62adef611e08f472ad297db40029") </code>
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

andBool #rangeUInt(256, CONTRACT_BAL)andBool THRESHOLD ==Int select(S, #hashedLocation("Solidity", 0, .IntList))
andBool #rangeUInt(256, THRESHOLD)

andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, SIGR_LEN)andBool SIGR_LEN =/=Int THRESHOLD
    ensures true




endmodule

