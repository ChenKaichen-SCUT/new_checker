; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x5724 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x191 (= ?x5724 ?x5724)))
(not $x191))))
(check-sat)
