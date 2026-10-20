; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x46 ((_ extract 1 1) p0-join-read-23)))
(let (($x42 (= ?x46 (_ bv0 1))))
(let (($x54 (= (not (and (distinct (_ bv0 1) ?x46) true)) $x42)))
(not $x54)))))
(check-sat)
