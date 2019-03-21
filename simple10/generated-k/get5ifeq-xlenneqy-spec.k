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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680634a415b7b14610051578063a56dfe4a146100b8575b600080fd5b34801561005d57600080fd5b506100a26004803603810190808035906020019082018035906020019190919293919293908035906020019082018035906020019190919293919293905050506100e3565b6040518082815260200191505060405180910390f35b3480156100c457600080fd5b506100cd610103565b6040518082815260200191505060405180910390f35b60008054858590501415156100f757600080fd5b60059050949350505050565b600054815600a165627a7a72305820024d1a16b82d7c9cb5a272b948bca468db674ace0f634552a3e26acdea0805bb0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680634a415b7b14610051578063a56dfe4a146100b8575b600080fd5b34801561005d57600080fd5b506100a26004803603810190808035906020019082018035906020019190919293919293908035906020019082018035906020019190919293919293905050506100e3565b6040518082815260200191505060405180910390f35b3480156100c457600080fd5b506100cd610103565b6040518082815260200191505060405180910390f35b60008054858590501415156100f757600080fd5b60059050949350505050565b600054815600a165627a7a72305820024d1a16b82d7c9cb5a272b948bca468db674ace0f634552a3e26acdea0805bb0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get5ifeq", #array(#uint8(_), XARR_LEN, _), #array(#uint256(_), ZARR_LEN, _)) </callData> // msg.data
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
            <code> #parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680634a415b7b14610051578063a56dfe4a146100b8575b600080fd5b34801561005d57600080fd5b506100a26004803603810190808035906020019082018035906020019190919293919293908035906020019082018035906020019190919293919293905050506100e3565b6040518082815260200191505060405180910390f35b3480156100c457600080fd5b506100cd610103565b6040518082815260200191505060405180910390f35b60008054858590501415156100f757600080fd5b60059050949350505050565b600054815600a165627a7a72305820024d1a16b82d7c9cb5a272b948bca468db674ace0f634552a3e26acdea0805bb0029") </code>
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

