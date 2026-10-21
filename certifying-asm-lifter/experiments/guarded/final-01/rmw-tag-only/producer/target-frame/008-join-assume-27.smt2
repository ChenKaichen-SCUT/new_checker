; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7454 ((_ extract 0 0) p0-join-read-23)))
(let (($x3005 (= ?x7454 (_ bv0 1))))
(let (($x7878 (= (not (and (distinct (_ bv0 1) ?x7454) true)) $x3005)))
(not $x7878)))))
(check-sat)
