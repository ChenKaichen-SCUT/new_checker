; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x1719 (bvadd (_ bv0 32) u0)))
(let (($x101 (= u0 ?x1719)))
(not $x101))))
(check-sat)
