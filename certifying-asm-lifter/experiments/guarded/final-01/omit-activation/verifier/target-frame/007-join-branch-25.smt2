; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7697 ((_ extract 1 1) p0-join-read-23)))
(let (($x6764 (= ?x7697 (_ bv0 1))))
(let (($x3023 (= (not (and (distinct (_ bv0 1) ?x7697) true)) $x6764)))
(not $x3023)))))
(check-sat)
