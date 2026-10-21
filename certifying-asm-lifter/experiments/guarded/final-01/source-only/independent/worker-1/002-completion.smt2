; benchmark generated from python API
(set-info :status unknown)
(declare-fun finish () (_ BitVec 2))
(assert
 (let ((?x192 (bvand finish (_ bv2 2))))
(let (($x8634 (= ?x192 ?x192)))
(not $x8634))))
(check-sat)
