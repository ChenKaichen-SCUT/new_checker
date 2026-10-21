; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x59 ((_ extract 1 1) p0-join-read-23)))
(let (($x7527 (= ?x59 (_ bv0 1))))
(let (($x109 (= (not (and (distinct (_ bv0 1) ?x59) true)) $x7527)))
(not $x109)))))
(check-sat)
