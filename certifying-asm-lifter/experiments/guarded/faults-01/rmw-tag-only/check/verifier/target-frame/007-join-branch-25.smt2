; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6951 ((_ extract 1 1) p0-join-read-23)))
(let (($x4630 (= ?x6951 (_ bv0 1))))
(let (($x818 (= (not (and (distinct (_ bv0 1) ?x6951) true)) $x4630)))
(not $x818)))))
(check-sat)
