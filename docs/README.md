* Running klab on a K spec: You don't need to write an act. 
You can run `klab prove --dump <SPEC.K>` and `klab debug $(klab hash <SPEC.k>)


* Replace whitespace with newlines:

`sed -i -E -e 's/[[:blank:]]+/\n/g' SimpleMultiSig.opcodes`