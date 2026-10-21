; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x11 (bvadd (_ bv0 32) u0)))
(let (($x15 (= u0 ?x11)))
(not $x15))))
(check-sat)
