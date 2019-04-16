requires "evm-symbolic.k"
requires "evm-data-symbolic.k"
requires "edsl.k"

module EDSL-STATIC-ARRAY
    imports EVM-SYMBOLIC
    imports EVM-DATA-SYMBOLIC
    imports EDSL

    syntax TypedArg ::= #staticarray1 (TypedArg , Int, TypedArgs )

    rule #typeName( #staticarray1(T, N, ELMS)) => #typeName(T) +String "[" +String Int2String(N) +String "]"

    rule #lenOfHead(#staticarray1(_, N, ELMS)) => 32 *Int N

    rule #isStaticType(#staticarray1(_, _, _)) => true

    rule #enc(#staticarray1( T, N, ELMS )) => #encodeArgs(ELMS)

endmodule