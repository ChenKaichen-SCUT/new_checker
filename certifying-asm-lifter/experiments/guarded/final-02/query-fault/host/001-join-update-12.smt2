; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2849 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x6949 (= ?x2849 ?x2849)))
(not $x6949))))
(check-sat)
