; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x5893 ((_ extract 1 1) p0-join-read-23)))
(let (($x8382 (= ?x5893 (_ bv0 1))))
(let (($x7616 (= (not (and (distinct (_ bv0 1) ?x5893) true)) $x8382)))
(not $x7616)))))
(check-sat)
