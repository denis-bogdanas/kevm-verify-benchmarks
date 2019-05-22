requires "abstract-semantics-segmented-gas.k"
requires "evm-symbolic.k"
requires "ecrec-symbolic.k"

module ABSTRACT-SEMANTICS
  imports ABSTRACT-SEMANTICS-SEGMENTED-GAS
  imports EVM-SYMBOLIC
  imports ECREC-SYMBOLIC
  imports EVM


  // ########################
  // Gas - in addition to ABSTRACT-SEMANTICS-COMMON
  // ########################

   // abstract call gas
   // normal functiona call GCAP == GAVAIL
   // call chain == 1
   rule <k> Ccallgas(SCHED, ISEMPTY:Bool, GCAP, GAVAIL, VALUE)
          => #gas(Cgascap(SCHED, GCAP, GAVAIL, Cextra(SCHED, ISEMPTY, VALUE)), 0, 0) ... </k>
     requires VALUE ==Int 0
      andBool #getKLabelString(GAVAIL) ==String "#gas"
      andBool GCAP ==Int GAVAIL
     [trusted]

   rule <k> Ccallgas(SCHED, ISEMPTY:Bool, GCAP, GAVAIL, VALUE)
          => #gas(Cgascap(SCHED, GCAP, GAVAIL, Cextra(SCHED, ISEMPTY, VALUE)) +Int Gcallstipend < SCHED >, 0, 0) ... </k>
     requires 0 <Int VALUE
      andBool #getKLabelString(GAVAIL) ==String "#gas"
      andBool GCAP ==Int GAVAIL
     [trusted]



  // ########################
  // Summary split
  // ########################

    rule <k> #exec [ CSO:CallSixOp ] => . ... </k>
         <wordStack> W0 : W1 : W2 : W3 : W4 : W5 : WS      => 1 : WS </wordStack>
         <localMem> LM </localMem>
         <callLog> L (.List => ListItem ( size(L) PCOUNT CSO W0 W1    W2 W3 W4 W5 LM )) </callLog>
         <pc> PCOUNT </pc>
    requires
        #callSuccess2 (size(L))
    [trusted]

    rule <k> #exec [ CO:CallOp ] => . ... </k>
         <wordStack> W0 : W1 : W2 : W3 : W4 : W5 : W6 : WS => 0 : WS </wordStack>
         <localMem> LM </localMem>
         <callLog> L (.List => ListItem ( size(L) PCOUNT CO  W0 W1 W2 W3 W4 W5 W6 LM )) </callLog>
         <pc> PCOUNT </pc>
    requires
        #callFailure2 (size(L))
    [trusted]


  // ########################
  // EXTCODESIZE
  // ########################

    rule <k> EXTCODESIZE ACCT => #extCodeSize(ACCT) ~> #push ... </k>  [trusted]

endmodule