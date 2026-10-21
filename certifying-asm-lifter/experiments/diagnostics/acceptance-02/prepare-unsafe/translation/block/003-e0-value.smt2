; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x24 (=> true (= (bvadd u0 |in:v0|) (bvadd u0 |in:v0|)))))
(not $x24)))
(check-sat)
