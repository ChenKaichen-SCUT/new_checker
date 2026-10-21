; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x378 (bvand p0-join-read-11 (_ bv1 2))))
(let (($x509 (= ?x378 ?x378)))
(not $x509))))
(check-sat)
