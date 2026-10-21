; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3716 ((_ extract 0 0) p0-join-read-11)))
(let (($x3651 (= ?x3716 (_ bv0 1))))
(let (($x8236 (= (not (and (distinct (_ bv0 1) ?x3716) true)) $x3651)))
(not $x8236)))))
(check-sat)
