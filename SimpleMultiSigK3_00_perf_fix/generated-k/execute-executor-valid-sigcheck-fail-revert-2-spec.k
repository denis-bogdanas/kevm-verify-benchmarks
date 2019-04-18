requires "abstract-semantics.k"
requires "verification.k"

module EXECUTE-EXECUTOR-VALID-SIGCHECK-FAIL-REVERT-2-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // execute-executor-valid-sigcheck-fail-revert-2 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e3332ff114610046575b600080fd5b34801561005257600080fd5b5061019760048036036101c081101561006a57600080fd5b8101908080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f8201169050808301925050505050509192919290803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001909291905050506101ad565b6040518082815260200191505060405180910390f35b6000806000905060008090505b60038110156102af5760006001858d846003811015156101d657fe5b60200201518d856003811015156101e957fe5b60200201518d866003811015156101fc57fe5b602002015160405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610258573d6000803e3d6000fd5b5050506020604051035190508273ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561029e57600080fd5b8092505080806001019150506101ba565b5060059150509897505050505050505056fea165627a7a723058205cb76991a4097abd70afe996ba254ff76ca0885df292002bc0407f2c472415180029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e3332ff114610046575b600080fd5b34801561005257600080fd5b5061019760048036036101c081101561006a57600080fd5b8101908080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f8201169050808301925050505050509192919290803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001909291905050506101ad565b6040518082815260200191505060405180910390f35b6000806000905060008090505b60038110156102af5760006001858d846003811015156101d657fe5b60200201518d856003811015156101e957fe5b60200201518d866003811015156101fc57fe5b602002015160405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610258573d6000803e3d6000fd5b5050506020604051035190508273ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561029e57600080fd5b8092505080806001019150506101ba565b5060059150509897505050505050505056fea165627a7a723058205cb76991a4097abd70afe996ba254ff76ca0885df292002bc0407f2c472415180029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute",
#staticarray1(#uint8(_), 3, #uint8(SIGV0), #uint8(SIGV1), #uint8(SIGV2)),
#staticarray1(#bytes32(_), 3, #bytes32(SIGR0), #bytes32(SIGR1), #bytes32(SIGR2)),
#staticarray1(#bytes32(_), 3, #bytes32(SIGS0), #bytes32(SIGS1), #bytes32(SIGS2)),
#address(DESTINATION),
#uint256(VALUE),
#address(EXECUTOR),
#uint256(GAS_LIMIT),
#bytes32(TX_TOTAL_HASH)) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e3332ff114610046575b600080fd5b34801561005257600080fd5b5061019760048036036101c081101561006a57600080fd5b8101908080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f820116905080830192505050505050919291929080606001906003806020026040519081016040528092919082600360200280828437600081840152601f19601f8201169050808301925050505050509192919290803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190803590602001909291905050506101ad565b6040518082815260200191505060405180910390f35b6000806000905060008090505b60038110156102af5760006001858d846003811015156101d657fe5b60200201518d856003811015156101e957fe5b60200201518d866003811015156101fc57fe5b602002015160405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610258573d6000803e3d6000fd5b5050506020604051035190508273ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561029e57600080fd5b8092505080806001019150506101ba565b5060059150509897505050505050505056fea165627a7a723058205cb76991a4097abd70afe996ba254ff76ca0885df292002bc0407f2c472415180029") </code>
            <storage>
S0
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

andBool #rangeUInt(256, CONTRACT_BAL)
andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeAddress(DESTINATION)
andBool #rangeUInt(256, VALUE)
andBool #rangeUInt(256, DATA_LEN)
andBool DATA_LEN <Int 2 ^Int 16
andBool #rangeAddress(EXECUTOR)
andBool #rangeUInt(256, GAS_LIMIT)

andBool #rangeUInt(8, SIGV0)
andBool #rangeUInt(8, SIGV1)
andBool #rangeUInt(8, SIGV2)
andBool #rangeBytes(32, SIGR0)
andBool #rangeBytes(32, SIGR1)
andBool #rangeBytes(32, SIGR2)
andBool #rangeBytes(32, SIGS0)
andBool #rangeBytes(32, SIGS1)
andBool #rangeBytes(32, SIGS2)
andBool ECREC_DATA2 ==K #encodeArgs( #bytes32(TX_TOTAL_HASH), #uint8(SIGV2), #bytes32(SIGR2), #bytes32(SIGS2) )
andBool #ecrecEmpty( ECREC_DATA2 )
    ensures true




endmodule

