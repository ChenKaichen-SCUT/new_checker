; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x120 ((_ extract 1 1) p0-join-read-11)))
(let (($x189 (= ?x120 (_ bv0 1))))
(let (($x408 (= (not (and (distinct (_ bv0 1) ?x120) true)) $x189)))
(not $x408)))))
(check-sat)
