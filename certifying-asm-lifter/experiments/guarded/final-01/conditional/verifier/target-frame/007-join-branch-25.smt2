; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x7781 ((_ extract 1 1) p0-join-read-23)))
(let (($x17 (= ?x7781 (_ bv0 1))))
(let (($x150 (= (not (and (distinct (_ bv0 1) ?x7781) true)) $x17)))
(not $x150)))))
(check-sat)
