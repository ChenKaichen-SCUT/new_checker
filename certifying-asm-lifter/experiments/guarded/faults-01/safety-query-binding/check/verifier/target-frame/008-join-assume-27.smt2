; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8920 ((_ extract 0 0) p0-join-read-23)))
(let (($x3338 (= ?x8920 (_ bv0 1))))
(let (($x24 (= (not (and (distinct (_ bv0 1) ?x8920) true)) $x3338)))
(not $x24)))))
(check-sat)
