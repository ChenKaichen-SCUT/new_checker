; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x53 (bvadd (_ bv0 32) u0)))
(let (($x27 (= u0 ?x53)))
(not $x27))))
(check-sat)
