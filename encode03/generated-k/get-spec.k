requires "abstract-semantics.k"
requires "verification.k"

module GET-SPEC
  imports ETHEREUM-SIMULATION
  imports ABSTRACT-SEMANTICS
  imports VERIFICATION

  // get 
  rule
    <k> (#execute => #halt) ~> _ </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> BYZANTIUM </schedule>
    <analysis> .Map </analysis> // not part of evm
    <ethereum>
      <evm>
        <output> _ => #padToWidth(32, #asByteStack(keccak(#parseHexWord("0x19")
: #parseHexWord("0x1")
: #encodeArgs(#bytes32(STORAGE0), #bytes32(ARG0)))) ) </output>
        <statusCode> _ => EVMC_SUCCESS </statusCode>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => _ </touchedAccounts>
        <callState>
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680638eaa6ac014610051578063e5f6c1971461009e575b600080fd5b34801561005d57600080fd5b5061008060048036038101908080356000191690602001909291905050506100d1565b60405180826000191660001916815260200191505060405180910390f35b3480156100aa57600080fd5b506100b361019d565b60405180826000191660001916815260200191505060405180910390f35b600080548260405160200180807f190100000000000000000000000000000000000000000000000000000000000081525060020183600019166000191681526020018260001916600019168152602001925050506040516020818303038152906040526040518082805190602001908083835b6020831015156101695780518252602082019150602081019050602083039250610144565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050919050565b600054815600a165627a7a72305820a0ae3036dc53c4f5562aa10af0080601a3dc7903870be6c12214974485cdb7b20029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680638eaa6ac014610051578063e5f6c1971461009e575b600080fd5b34801561005d57600080fd5b5061008060048036038101908080356000191690602001909291905050506100d1565b60405180826000191660001916815260200191505060405180910390f35b3480156100aa57600080fd5b506100b361019d565b60405180826000191660001916815260200191505060405180910390f35b600080548260405160200180807f190100000000000000000000000000000000000000000000000000000000000081525060020183600019166000191681526020018260001916600019168152602001925050506040516020818303038152906040526040518082805190602001908083835b6020831015156101695780518252602082019150602081019050602083039250610144565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050919050565b600054815600a165627a7a72305820a0ae3036dc53c4f5562aa10af0080601a3dc7903870be6c12214974485cdb7b20029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("get", #bytes32(ARG0) ) </callData> // msg.data
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
            <code> #parseByteStack("0x60806040526004361061004c576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680638eaa6ac014610051578063e5f6c1971461009e575b600080fd5b34801561005d57600080fd5b5061008060048036038101908080356000191690602001909291905050506100d1565b60405180826000191660001916815260200191505060405180910390f35b3480156100aa57600080fd5b506100b361019d565b60405180826000191660001916815260200191505060405180910390f35b600080548260405160200180807f190100000000000000000000000000000000000000000000000000000000000081525060020183600019166000191681526020018260001916600019168152602001925050506040516020818303038152906040526040518082805190602001908083835b6020831015156101695780518252602082019150602081019050602083039250610144565b6001836020036101000a03801982511681845116808217855250505050505090500191505060405180910390209050919050565b600054815600a165627a7a72305820a0ae3036dc53c4f5562aa10af0080601a3dc7903870be6c12214974485cdb7b20029") </code>
            <storage>
M
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
andBool #range(0 <= CD < 1024)
andBool #rangeAddress(MSG_SENDER)
andBool #rangeUInt(256, ARG0)

andBool STORAGE0 ==Int select(M, #hashedLocation("Solidity", 0, .IntList))
andBool #rangeBytes(32, STORAGE0)
    ensures true




endmodule

