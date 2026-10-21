; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x30 (bvadd (_ bv0 32) u0)))
(let (($x48 (= u0 ?x30)))
(not $x48))))
(check-sat)
