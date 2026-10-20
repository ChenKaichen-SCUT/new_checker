; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:delta| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (=> true (= (bvadd u0 |in:delta|) (bvadd u0 |in:delta|)))))
(not $x19)))
(check-sat)
