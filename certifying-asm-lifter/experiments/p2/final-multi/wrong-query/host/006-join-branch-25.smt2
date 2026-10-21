; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x78 ((_ extract 1 1) p0-join-read-23)))
(let (($x55 (= ?x78 (_ bv0 1))))
(let (($x65 (= (not (and (distinct (_ bv0 1) ?x78) true)) $x55)))
(not $x65)))))
(check-sat)
