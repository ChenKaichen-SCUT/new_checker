; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2584 ((_ extract 0 0) p0-join-read-23)))
(let (($x8719 (= ?x2584 (_ bv0 1))))
(let (($x120 (= (not (and (distinct (_ bv0 1) ?x2584) true)) $x8719)))
(not $x120)))))
(check-sat)
