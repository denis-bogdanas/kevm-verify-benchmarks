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
          <program> #asMapOpCodes(#dasmOpCodes(#parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e8146100675780638af7c64914610092578063aa5df9e2146100e1578063affed0e01461014e575b600080fd5b34801561007357600080fd5b5061007c610179565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b506100cb60048036038101908080359060200190820180359060200191909192939192939050505061017f565b6040518082815260200191505060405180910390f35b3480156100ed57600080fd5b5061010c6004803603810190808035906020019092919050505061019e565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561015a57600080fd5b506101636101dc565b6040518082815260200191505060405180910390f35b60015481565b60006001548383905014151561019457600080fd5b6005905092915050565b6003818154811015156101ad57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a72305820dd8b990531d4701af6dc16260f27f21090406cedf8c525915bd3d04c5c36a73e0029"), BYZANTIUM)) </program>
          <programBytes> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e8146100675780638af7c64914610092578063aa5df9e2146100e1578063affed0e01461014e575b600080fd5b34801561007357600080fd5b5061007c610179565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b506100cb60048036038101908080359060200190820180359060200191909192939192939050505061017f565b6040518082815260200191505060405180910390f35b3480156100ed57600080fd5b5061010c6004803603810190808035906020019092919050505061019e565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561015a57600080fd5b506101636101dc565b6040518082815260200191505060405180910390f35b60015481565b60006001548383905014151561019457600080fd5b6005905092915050565b6003818154811015156101ad57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a72305820dd8b990531d4701af6dc16260f27f21090406cedf8c525915bd3d04c5c36a73e0029") </programBytes>
          <id> #CONTRACT_ID </id> // this
          <caller> MSG_SENDER </caller> // msg.sender
          <callData> #abiCallData("execute", #array(#uint8(_), SIGV_LEN, _)) </callData> // msg.data
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
            <code> #parseByteStack("0x608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806342cde4e8146100675780638af7c64914610092578063aa5df9e2146100e1578063affed0e01461014e575b600080fd5b34801561007357600080fd5b5061007c610179565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b506100cb60048036038101908080359060200190820180359060200191909192939192939050505061017f565b6040518082815260200191505060405180910390f35b3480156100ed57600080fd5b5061010c6004803603810190808035906020019092919050505061019e565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b34801561015a57600080fd5b506101636101dc565b6040518082815260200191505060405180910390f35b60015481565b60006001548383905014151561019457600080fd5b6005905092915050565b6003818154811015156101ad57fe5b906000526020600020016000915054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600054815600a165627a7a72305820dd8b990531d4701af6dc16260f27f21090406cedf8c525915bd3d04c5c36a73e0029") </code>
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
andBool #rangeUInt(256, SIGR_LEN)andBool SIGR_LEN =/=Int THRESHOLD
    ensures true




endmodule

