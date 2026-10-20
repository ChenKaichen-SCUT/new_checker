; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x35 ((_ extract 0 0) p0-join-read-23)))
(let (($x45 (= ?x35 (_ bv0 1))))
(let (($x56 (= (not (and (distinct (_ bv0 1) ?x35) true)) $x45)))
(not $x56)))))
(check-sat)
