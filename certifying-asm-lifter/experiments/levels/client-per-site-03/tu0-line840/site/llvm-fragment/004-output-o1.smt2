; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let ((?x25 (bvadd (_ bv0 64) u0)))
(let (($x27 (= u0 ?x25)))
(not $x27))))
(check-sat)
