; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x96 ((_ extract 0 0) p0-join-read-23)))
(let (($x174 (= ?x96 (_ bv0 1))))
(let (($x248 (= (not (and (distinct (_ bv0 1) ?x96) true)) $x174)))
(not $x248)))))
(check-sat)
