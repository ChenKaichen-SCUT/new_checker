; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x19 ((_ extract 1 1) p0-join-read-23)))
(let (($x84 (= ?x19 (_ bv0 1))))
(let (($x85 (= (not (and (distinct (_ bv0 1) ?x19) true)) $x84)))
(not $x85)))))
(check-sat)
