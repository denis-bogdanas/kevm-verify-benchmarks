requires "abstract-semantics.k"
requires "verification.k"

module EXECUTE-SIGRLENCHECK-FAILURE-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // execute-sigrlencheck-failure 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e81461006757806347b58efe14610092578063aa5df9e2146100f9578063affed0e014610166575b600080fd5b34801561007357600080fd5b5061007c610191565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b506100e3600480360381019080803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390505050610197565b6040518082815260200191505060405180910390f35b34801561010557600080fd5b50610124600480360381019080803590602001909291905050506101b8565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561017257600080fd5b5061017b6101f6565b6040518082815260200191505060405180910390f35b60015481565b6000600154838390501415156101ac57600080fd5b60059050949350505050565b6003818154811015156101c757fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a7230582035c7ca16bea47445d9202f5f334c85c5ab2008bb2ada9c02357e9c3e26bf3b710029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e81461006757806347b58efe14610092578063aa5df9e2146100f9578063affed0e014610166575b600080fd5b34801561007357600080fd5b5061007c610191565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b506100e3600480360381019080803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390505050610197565b6040518082815260200191505060405180910390f35b34801561010557600080fd5b50610124600480360381019080803590602001909291905050506101b8565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561017257600080fd5b5061017b6101f6565b6040518082815260200191505060405180910390f35b60015481565b6000600154838390501415156101ac57600080fd5b60059050949350505050565b6003818154811015156101c757fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a7230582035c7ca16bea47445d9202f5f334c85c5ab2008bb2ada9c02357e9c3e26bf3b710029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute", #array(#uint8(_), SIGV_LEN, _), #array(#bytes32(_), SIGR_LEN, _) ) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e81461006757806347b58efe14610092578063aa5df9e2146100f9578063affed0e014610166575b600080fd5b34801561007357600080fd5b5061007c610191565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b506100e3600480360381019080803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390505050610197565b6040518082815260200191505060405180910390f35b34801561010557600080fd5b50610124600480360381019080803590602001909291905050506101b8565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561017257600080fd5b5061017b6101f6565b6040518082815260200191505060405180910390f35b60015481565b6000600154838390501415156101ac57600080fd5b60059050949350505050565b6003818154811015156101c757fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a7230582035c7ca16bea47445d9202f5f334c85c5ab2008bb2ada9c02357e9c3e26bf3b710029") </code>
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

andBool #rangeUInt(256, CONTRACT_BAL)andBool THRESHOLD ==Int select(S, #hashedLocation("Solidity", 6, .IntList))
andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, SIGR_LEN)
andBool #rangeUInt(256, THRESHOLD)andBool SIGR_LEN =/=Int THRESHOLD
    ensures true




endmodule

