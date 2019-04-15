requires "abstract-semantics.k"
requires "verification.k"

module EXECUTE-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // execute 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806313c01cb914610059578063aa5df9e214610125578063affed0e014610192575b005b34801561006557600080fd5b5061010f600480360381019080803560ff16906020019092919080356000191690602001909291908035600019169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506101bd565b6040518082815260200191505060405180910390f35b34801561013157600080fd5b50610150600480360381019080803590602001909291905050506101d0565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561019e57600080fd5b506101a761020e565b6040518082815260200191505060405180910390f35b6000600590509998505050505050505050565b6002818154811015156101df57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a72305820f3fe2d577386c5a08c8dc16fc60a6a75a7a05b425fa9ee31c7760a43cb5465ef0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806313c01cb914610059578063aa5df9e214610125578063affed0e014610192575b005b34801561006557600080fd5b5061010f600480360381019080803560ff16906020019092919080356000191690602001909291908035600019169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506101bd565b6040518082815260200191505060405180910390f35b34801561013157600080fd5b50610150600480360381019080803590602001909291905050506101d0565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561019e57600080fd5b506101a761020e565b6040518082815260200191505060405180910390f35b6000600590509998505050505050505050565b6002818154811015156101df57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a72305820f3fe2d577386c5a08c8dc16fc60a6a75a7a05b425fa9ee31c7760a43cb5465ef0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute",
#uint8(_),
#bytes32(_),
#bytes32(_),
#address(_),
#uint256(_),
#bytes(_),
#address(_),
#uint256(_) ) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806313c01cb914610059578063aa5df9e214610125578063affed0e014610192575b005b34801561006557600080fd5b5061010f600480360381019080803560ff16906020019092919080356000191690602001909291908035600019169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506101bd565b6040518082815260200191505060405180910390f35b34801561013157600080fd5b50610150600480360381019080803590602001909291905050506101d0565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561019e57600080fd5b506101a761020e565b6040518082815260200191505060405180910390f35b6000600590509998505050505050505050565b6002818154811015156101df57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a72305820f3fe2d577386c5a08c8dc16fc60a6a75a7a05b425fa9ee31c7760a43cb5465ef0029") </code>
            <storage>
_
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

andBool #rangeUInt(256, CONTRACT_BAL)andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
    ensures true




endmodule

