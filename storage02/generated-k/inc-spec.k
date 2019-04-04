requires "abstract-semantics.k"
requires "verification.k"

module INC-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // inc 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => #encodeArgs(#uint256(5)) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063371303c014604e578063affed0e0146076575b600080fd5b348015605957600080fd5b506060609e565b6040518082815260200191505060405180910390f35b348015608157600080fd5b50608860af565b6040518082815260200191505060405180910390f35b600060016000819055506005905090565b600054815600a165627a7a723058202415e454c8b7b05e19c16bec30a9759360809ad29babce526a3d87d52e9f27f70029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063371303c014604e578063affed0e0146076575b600080fd5b348015605957600080fd5b506060609e565b6040518082815260200191505060405180910390f35b348015608157600080fd5b50608860af565b6040518082815260200191505060405180910390f35b600060016000819055506005905090565b600054815600a165627a7a723058202415e454c8b7b05e19c16bec30a9759360809ad29babce526a3d87d52e9f27f70029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("inc", .TypedArgs) </callData> // msg.data
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
          <refund> _ => _ </refund>
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
            <code> #parseByteStack("0x6080604052600436106049576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063371303c014604e578063affed0e0146076575b600080fd5b348015605957600080fd5b506060609e565b6040518082815260200191505060405180910390f35b348015608157600080fd5b50608860af565b6040518082815260200191505060405180910390f35b600060016000819055506005905090565b600054815600a165627a7a723058202415e454c8b7b05e19c16bec30a9759360809ad29babce526a3d87d52e9f27f70029") </code>
            <storage>
S0 => S1
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
                _ => _
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
andBool NONCE_0 ==Int select(S0, #hashedLocation("Solidity", 0, .IntList))
    ensures true
andBool S0 ==IMap S1 except (SetItem(#hashedLocation("Solidity", 0, .IntList)) .Set)
andBool NONCE_1 ==Int select(S1, #hashedLocation("Solidity", 0, .IntList))
andBool NONCE_1 ==Int 1



endmodule

