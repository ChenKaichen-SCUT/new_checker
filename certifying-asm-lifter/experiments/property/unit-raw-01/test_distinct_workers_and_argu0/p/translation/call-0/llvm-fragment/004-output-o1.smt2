; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x23 (bvadd (_ bv0 32) u0)))
(let (($x102 (= u0 ?x23)))
(not $x102))))
(check-sat)
