; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v1| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x53 (=> true (= (bvadd u0 |in:v1|) (bvadd u0 |in:v1|)))))
(not $x53)))
(check-sat)
