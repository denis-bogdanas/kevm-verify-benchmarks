requires "abstract-semantics.k"
requires "verification.k"

module GET-FAILURE-1-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // get-failure-1 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063107cf64f14610046575b600080fd5b34801561005257600080fd5b506101166004803603604081101561006957600080fd5b810190808035906020019064010000000081111561008657600080fd5b82018360208201111561009857600080fd5b803590602001918460018302840111640100000000831117156100ba57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019092919050505061012c565b6040518082815260200191505060405180910390f35b6000806001836001806001026001800260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610193573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff161115156101da57600080fd5b6001836001806001026001800260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa15801561023e573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561028557600080fd5b60059150509291505056fea165627a7a72305820c0a13c4cfa2dc40d1a9aeb859628a7d5ec726fa4c35cb00c8076a0f792a8d83e0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063107cf64f14610046575b600080fd5b34801561005257600080fd5b506101166004803603604081101561006957600080fd5b810190808035906020019064010000000081111561008657600080fd5b82018360208201111561009857600080fd5b803590602001918460018302840111640100000000831117156100ba57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019092919050505061012c565b6040518082815260200191505060405180910390f35b6000806001836001806001026001800260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610193573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff161115156101da57600080fd5b6001836001806001026001800260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa15801561023e573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561028557600080fd5b60059150509291505056fea165627a7a72305820c0a13c4cfa2dc40d1a9aeb859628a7d5ec726fa4c35cb00c8076a0f792a8d83e0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get",
#bytes(#buf(DATA_LEN,DATA)),
#bytes32(HASH)) </callData> // msg.data
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
            <balance> _ </balance>
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063107cf64f14610046575b600080fd5b34801561005257600080fd5b506101166004803603604081101561006957600080fd5b810190808035906020019064010000000081111561008657600080fd5b82018360208201111561009857600080fd5b803590602001918460018302840111640100000000831117156100ba57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192908035906020019092919050505061012c565b6040518082815260200191505060405180910390f35b6000806001836001806001026001800260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa158015610193573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff161115156101da57600080fd5b6001836001806001026001800260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa15801561023e573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561028557600080fd5b60059150509291505056fea165627a7a72305820c0a13c4cfa2dc40d1a9aeb859628a7d5ec726fa4c35cb00c8076a0f792a8d83e0029") </code>
            <storage>
M
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


andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeBytes(32, HASH)

andBool #rangeUInt(256, DATA_LEN)
andBool DATA_LEN <Int 2 ^Int 16
andBool 0 <Int DATA_LEN

andBool ECREC_DATA0 ==K #encodeArgs( #bytes32(HASH), #uint8(0), #bytes32(0), #bytes32(0) )
andBool ECREC_DATA1 ==K #encodeArgs( #bytes32(HASH), #uint8(1), #bytes32(1), #bytes32(1) )
andBool #ecrecEmpty( ECREC_DATA1 )
    ensures true




endmodule

