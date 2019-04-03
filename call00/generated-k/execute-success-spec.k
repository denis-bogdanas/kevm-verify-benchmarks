requires "abstract-semantics.k"
requires "verification.k"

module EXECUTE-SUCCESS-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // execute-success 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => _ </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680633b89bb86146044575b600080fd5b348015604f57600080fd5b50608c600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505060a6565b604051808215151515815260200191505060405180910390f35b6000806000905060008060008060008888f1905080915050929150505600a165627a7a7230582010ed575e12bd90994ca7cf3c7a9c5ce7d91943d5619735bd893612f81867c64d0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680633b89bb86146044575b600080fd5b348015604f57600080fd5b50608c600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505060a6565b604051808215151515815260200191505060405180910390f35b6000806000905060008060008060008888f1905080915050929150505600a165627a7a7230582010ed575e12bd90994ca7cf3c7a9c5ce7d91943d5619735bd893612f81867c64d0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute", (
#address(DESTINATION),
#uint256(GAS_LIMIT)
)) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680633b89bb86146044575b600080fd5b348015604f57600080fd5b50608c600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505060a6565b604051808215151515815260200191505060405180910390f35b6000806000905060008060008060008888f1905080915050929150505600a165627a7a7230582010ed575e12bd90994ca7cf3c7a9c5ce7d91943d5619735bd893612f81867c64d0029") </code>
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

andBool #rangeUInt(256, CONTRACT_BAL)
andBool #range(0 <= CD < 1023)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeAddress(DESTINATION)
andBool #rangeUInt(256, GAS_LIMIT)
andBool #range(0 <= #sizeWordStack(WS) <= 1000)
    ensures true




endmodule

