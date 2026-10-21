; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x180 ((_ extract 1 1) p0-join-read-23)))
(let (($x197 (= ?x180 (_ bv0 1))))
(let (($x2617 (= (not (and (distinct (_ bv0 1) ?x180) true)) $x197)))
(not $x2617)))))
(check-sat)
