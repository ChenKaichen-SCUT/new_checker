; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x235 (bvadd (_ bv0 32) u0)))
(let (($x1719 (= u0 ?x235)))
(not $x1719))))
(check-sat)
