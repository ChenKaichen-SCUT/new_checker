; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1916 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x1086 (= ?x1916 ?x1916)))
(not $x1086))))
(check-sat)
