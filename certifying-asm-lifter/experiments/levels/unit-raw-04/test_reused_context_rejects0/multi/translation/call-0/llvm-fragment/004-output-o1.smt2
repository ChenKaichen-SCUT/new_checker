; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x73 (bvadd (_ bv0 32) u0)))
(let (($x79 (= u0 ?x73)))
(not $x79))))
(check-sat)
