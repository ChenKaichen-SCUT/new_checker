; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x227 (bvand p0-join-read-23 (_ bv1 2))))
(let (($x1198 (= ?x227 ?x227)))
(not $x1198))))
(check-sat)
