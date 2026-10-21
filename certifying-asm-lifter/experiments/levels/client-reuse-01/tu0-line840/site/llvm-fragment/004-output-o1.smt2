; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let ((?x28 (bvadd (_ bv0 64) u0)))
(let (($x33 (= u0 ?x28)))
(not $x33))))
(check-sat)
