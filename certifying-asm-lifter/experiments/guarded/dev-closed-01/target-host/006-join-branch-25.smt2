; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x58 ((_ extract 1 1) p0-join-read-23)))
(let (($x30 (= ?x58 (_ bv0 1))))
(let (($x6 (= (not (and (distinct (_ bv0 1) ?x58) true)) $x30)))
(not $x6)))))
(check-sat)
