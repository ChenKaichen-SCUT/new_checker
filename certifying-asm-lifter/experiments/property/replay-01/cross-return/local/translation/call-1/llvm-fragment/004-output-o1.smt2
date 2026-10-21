; benchmark generated from python API
(set-info :status unknown)
(declare-fun u0 () (_ BitVec 32))
(assert
 (let ((?x1784 (bvadd (_ bv0 32) u0)))
(let (($x2698 (= u0 ?x1784)))
(not $x2698))))
(check-sat)
