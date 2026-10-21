; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(declare-fun |llvm-entry:%7| () (_ BitVec 32))
(assert
 (let (($x22 (=> true (= (bvadd u0 |llvm-entry:%7|) (bvadd u0 (_ bv1 32))))))
(not $x22)))
(check-sat)
