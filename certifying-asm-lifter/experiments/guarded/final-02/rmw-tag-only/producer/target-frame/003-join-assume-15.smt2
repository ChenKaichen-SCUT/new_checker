; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x4324 ((_ extract 0 0) p0-join-read-11)))
(let (($x2802 (= ?x4324 (_ bv0 1))))
(let (($x8981 (= (not (and (distinct (_ bv0 1) ?x4324) true)) $x2802)))
(not $x8981)))))
(check-sat)
