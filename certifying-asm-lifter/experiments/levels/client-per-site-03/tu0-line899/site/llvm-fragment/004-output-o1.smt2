; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 64))
(assert
 (let ((?x16 (bvadd (_ bv0 64) u0)))
(let (($x32 (= u0 ?x16)))
(not $x32))))
(check-sat)
