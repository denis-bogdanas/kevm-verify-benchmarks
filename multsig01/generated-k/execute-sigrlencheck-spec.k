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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e814610067578063a0ab965314610092578063aa5df9e21461017d578063affed0e0146101ea575b600080fd5b34801561007357600080fd5b5061007c610215565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b50610167600480360381019080803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505061021b565b6040518082815260200191505060405180910390f35b34801561018957600080fd5b506101a8600480360381019080803590602001909291905050506102da565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156101f657600080fd5b506101ff610318565b6040518082815260200191505060405180910390f35b60015481565b60006001548b8b905014151561023057600080fd5b888890508b8b905014801561024a57508c8c90508b8b9050145b151561025557600080fd5b3373ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff1614806102bb5750600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff16145b15156102c657600080fd5b600590509c9b505050505050505050505050565b6003818154811015156102e957fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a7230582085586863fa6ec97b93a26ca12c4218c4d0ac680314f7894c1363a9aa28bb887b0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e814610067578063a0ab965314610092578063aa5df9e21461017d578063affed0e0146101ea575b600080fd5b34801561007357600080fd5b5061007c610215565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b50610167600480360381019080803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505061021b565b6040518082815260200191505060405180910390f35b34801561018957600080fd5b506101a8600480360381019080803590602001909291905050506102da565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156101f657600080fd5b506101ff610318565b6040518082815260200191505060405180910390f35b60015481565b60006001548b8b905014151561023057600080fd5b888890508b8b905014801561024a57508c8c90508b8b9050145b151561025557600080fd5b3373ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff1614806102bb5750600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff16145b15156102c657600080fd5b600590509c9b505050505050505050505050565b6003818154811015156102e957fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a7230582085586863fa6ec97b93a26ca12c4218c4d0ac680314f7894c1363a9aa28bb887b0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute", (
#array(#uint8(_), SIGV_LEN, SIGV),
#array(#bytes32(_), SIGR_LEN, SIGR),
#array(#bytes32(_), SIGS_LEN, SIGS),
#address(DESTINATION),
#uint256(VALUE),
#bytes(DATA),
#address(EXECUTOR),
#uint256(GAS_LIMIT) )) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e814610067578063a0ab965314610092578063aa5df9e21461017d578063affed0e0146101ea575b600080fd5b34801561007357600080fd5b5061007c610215565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b50610167600480360381019080803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001908201803590602001919091929391929390803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505061021b565b6040518082815260200191505060405180910390f35b34801561018957600080fd5b506101a8600480360381019080803590602001909291905050506102da565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b3480156101f657600080fd5b506101ff610318565b6040518082815260200191505060405180910390f35b60015481565b60006001548b8b905014151561023057600080fd5b888890508b8b905014801561024a57508c8c90508b8b9050145b151561025557600080fd5b3373ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff1614806102bb5750600073ffffffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffffffffffffffffff16145b15156102c657600080fd5b600590509c9b505050505050505050505050565b6003818154811015156102e957fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a7230582085586863fa6ec97b93a26ca12c4218c4d0ac680314f7894c1363a9aa28bb887b0029") </code>
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
andBool #rangeUInt(256, THRESHOLD)

andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, SIGV_LEN)
andBool #rangeUInt(256, SIGR_LEN)
andBool #rangeUInt(256, SIGS_LEN)
andBool #rangeAddress(DESTINATION)
andBool #rangeUInt(256, VALUE)
andBool #rangeUInt(256, DATA_LEN)
andBool #rangeAddress(EXECUTOR)
andBool #rangeUInt(256, GAS_LIMIT)andBool SIGR_LEN =/=Int THRESHOLD
    ensures true




endmodule

