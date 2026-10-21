; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1570 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x734 (= ?x1570 ?x1570)))
(not $x734))))
(check-sat)
