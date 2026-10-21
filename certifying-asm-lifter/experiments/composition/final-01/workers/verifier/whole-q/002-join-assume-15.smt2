; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x44 ((_ extract 0 0) p0-join-read-11)))
(let (($x13 (= ?x44 (_ bv0 1))))
(let (($x40 (= (not (and (distinct (_ bv0 1) ?x44) true)) $x13)))
(not $x40)))))
(check-sat)
