; benchmark generated from python API
(set-info :status unknown)
(declare-fun |llvm-entry:%2| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x46 (=> true (= (bvadd u0 |llvm-entry:%2|) (bvadd u0 |llvm-entry:%2|)))))
(not $x46)))
(check-sat)
