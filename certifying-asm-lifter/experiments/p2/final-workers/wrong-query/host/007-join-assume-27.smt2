; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x57 ((_ extract 0 0) p0-join-read-23)))
(let (($x31 (= ?x57 (_ bv0 1))))
(let (($x55 (= (not (and (distinct (_ bv0 1) ?x57) true)) $x31)))
(not $x55)))))
(check-sat)
