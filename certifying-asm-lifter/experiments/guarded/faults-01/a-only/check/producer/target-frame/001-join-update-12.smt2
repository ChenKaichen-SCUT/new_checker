; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1615 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x8107 (= ?x1615 ?x1615)))
(not $x8107))))
(check-sat)
