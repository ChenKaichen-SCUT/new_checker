; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x250 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x105 (= ?x250 ?x250)))
(not $x105))))
(check-sat)
