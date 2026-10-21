; benchmark generated from python API
(set-info :status unknown)
(declare-fun |llvm-entry:%7| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x37 (=> true (= (bvadd u0 |llvm-entry:%7|) (bvadd u0 |llvm-entry:%7|)))))
(not $x37)))
(check-sat)
