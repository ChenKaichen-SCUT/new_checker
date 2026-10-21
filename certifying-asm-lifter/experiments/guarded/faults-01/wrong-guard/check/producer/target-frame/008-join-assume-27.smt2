; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x68 ((_ extract 0 0) p0-join-read-23)))
(let (($x69 (= ?x68 (_ bv0 1))))
(let (($x49 (= (not (and (distinct (_ bv0 1) ?x68) true)) $x69)))
(not $x49)))))
(check-sat)
