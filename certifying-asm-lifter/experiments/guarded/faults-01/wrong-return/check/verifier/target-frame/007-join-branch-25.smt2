; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x107 ((_ extract 1 1) p0-join-read-23)))
(let (($x242 (= ?x107 (_ bv0 1))))
(let (($x96 (= (not (and (distinct (_ bv0 1) ?x107) true)) $x242)))
(not $x96)))))
(check-sat)
