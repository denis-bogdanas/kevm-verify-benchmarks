requires "abstract-semantics.k"
requires "verification.k"

module GET-SUCCESS-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION


    syntax CallLog ::= Int Int Int Int Int Int Int Int Int Map

    rule <k> #exec [ CALL ] => . ... </k>
         <wordStack> W0 : W1 : W2 : W3 : W4 : W5 : W6 : WS => 1 : WS </wordStack>
         <localMem> LM </localMem>
         <callLog> L (.List => ListItem ( size(L) PCOUNT W0 W1 W2 W3 W4 W5 W6 LM )) </callLog>
         <pc> PCOUNT </pc>
    requires
        PCOUNT in ( SetItem( 564 ) )
        andBool #callSuccess (size(L), W1)
    [trusted]


    rule <k> #exec [ CALL ] => . ... </k>
         <wordStack> W0 : W1 : W2 : W3 : W4 : W5 : W6 : WS => 0 : WS </wordStack>
         <localMem> LM </localMem>
         <callLog> L (.List => ListItem ( size(L) PCOUNT W0 W1 W2 W3 W4 W5 W6 LM )) </callLog>
         <pc> PCOUNT </pc>
    requires
        PCOUNT in ( SetItem( 564 ) )
        andBool #callFailure (size(L), W1)
    [trusted]

  // get-success 
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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680634616523714610046575b600080fd5b34801561005257600080fd5b50610156600480360360c081101561006957600080fd5b810190808035151590602001909291908035906020019092919080359060200190929190803590602001906401000000008111156100a657600080fd5b8201836020820111156100b857600080fd5b803590602001918460018302840111640100000000831117156100da57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610158565b005b60008090505b600281101561022157600060018383846001028560010260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa1580156101cc573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561021357600080fd5b50808060010191505061015e565b50600080905060008085516020870188878bf1905080151561024257600080fd5b5050505050505056fea165627a7a723058209dc2968ce32dfd3060564f6c7c430311c149004344fe5a02681b9c6b4a8876ee0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680634616523714610046575b600080fd5b34801561005257600080fd5b50610156600480360360c081101561006957600080fd5b810190808035151590602001909291908035906020019092919080359060200190929190803590602001906401000000008111156100a657600080fd5b8201836020820111156100b857600080fd5b803590602001918460018302840111640100000000831117156100da57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610158565b005b60008090505b600281101561022157600060018383846001028560010260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa1580156101cc573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561021357600080fd5b50808060010191505061015e565b50600080905060008085516020870188878bf1905080151561024257600080fd5b5050505050505056fea165627a7a723058209dc2968ce32dfd3060564f6c7c430311c149004344fe5a02681b9c6b4a8876ee0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get",
#bool(CONDITION_SB),
#uint256(GAS_LIMIT_SB), #uint256(VALUE_SB),
#bytes(#buf(DATA_LEN,DATA)), #address(DESTINATION),
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
          <callLog> .List => ListItem ( 0 564 GAS_LIMIT_SB DESTINATION VALUE_SB ARGSTART_C ARGWIDTH_C 0 0 LM_C ) .List </callLog>
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
            <code> #parseByteStack("0x608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680634616523714610046575b600080fd5b34801561005257600080fd5b50610156600480360360c081101561006957600080fd5b810190808035151590602001909291908035906020019092919080359060200190929190803590602001906401000000008111156100a657600080fd5b8201836020820111156100b857600080fd5b803590602001918460018302840111640100000000831117156100da57600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f820116905080830192505050505050509192919290803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610158565b005b60008090505b600281101561022157600060018383846001028560010260405160008152602001604052604051808581526020018460ff1660ff1681526020018381526020018281526020019450505050506020604051602081039080840390855afa1580156101cc573d6000803e3d6000fd5b505050602060405103519050600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff1611151561021357600080fd5b50808060010191505061015e565b50600080905060008085516020870188878bf1905080151561024257600080fd5b5050505050505056fea165627a7a723058209dc2968ce32dfd3060564f6c7c430311c149004344fe5a02681b9c6b4a8876ee0029") </code>
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

andBool ECREC_DATA0 ==K #encodeArgs( #bytes32(HASH), #uint8(0), #bytes32(0), #bytes32(0) )
andBool ECREC_DATA1 ==K #encodeArgs( #bytes32(HASH), #uint8(1), #bytes32(1), #bytes32(1) )
andBool RECOVERED0 ==Int #symEcrec( ECREC_DATA0 )
andBool RECOVERED1 ==Int #symEcrec( ECREC_DATA1 )
andBool notBool #ecrecEmpty( ECREC_DATA0 )
andBool notBool #ecrecEmpty( ECREC_DATA1 )
andBool #callSuccess(0, DESTINATION)
    ensures true
andBool selectRange(LM_C, ARGSTART_C, ARGWIDTH_C) ==K #buf(DATA_LEN,DATA)



endmodule

