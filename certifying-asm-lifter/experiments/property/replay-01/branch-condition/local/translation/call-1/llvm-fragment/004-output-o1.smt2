; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x2698 (bvadd (_ bv0 32) u0)))
(let (($x381 (= u0 ?x2698)))
(not $x381))))
(check-sat)
