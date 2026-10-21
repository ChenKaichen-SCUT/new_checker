; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x31 (bvadd (_ bv0 32) u0)))
(let (($x32 (= u0 ?x31)))
(not $x32))))
(check-sat)
