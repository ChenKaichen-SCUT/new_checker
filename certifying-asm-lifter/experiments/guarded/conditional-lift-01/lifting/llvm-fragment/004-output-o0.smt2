; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x2029 (bvadd (_ bv0 32) u0)))
(let (($x205 (= u0 ?x2029)))
(not $x205))))
(check-sat)
