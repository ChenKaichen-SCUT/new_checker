; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3506 ((_ extract 1 1) p0-join-read-23)))
(let (($x6887 (= ?x3506 (_ bv0 1))))
(let (($x5252 (= (not (and (distinct (_ bv0 1) ?x3506) true)) $x6887)))
(not $x5252)))))
(check-sat)
