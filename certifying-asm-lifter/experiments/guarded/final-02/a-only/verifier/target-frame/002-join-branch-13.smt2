; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x408 ((_ extract 1 1) p0-join-read-11)))
(let (($x463 (= ?x408 (_ bv0 1))))
(let (($x243 (= (not (and (distinct (_ bv0 1) ?x408) true)) $x463)))
(not $x243)))))
(check-sat)
