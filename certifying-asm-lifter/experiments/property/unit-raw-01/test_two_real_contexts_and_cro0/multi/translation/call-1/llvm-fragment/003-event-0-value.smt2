; benchmark generated from python API
(set-info :status unknown)
(declare-fun |llvm-entry:%3| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x11 (=> true (= (bvadd u0 |llvm-entry:%3|) (bvadd u0 |llvm-entry:%3|)))))
(not $x11)))
(check-sat)
