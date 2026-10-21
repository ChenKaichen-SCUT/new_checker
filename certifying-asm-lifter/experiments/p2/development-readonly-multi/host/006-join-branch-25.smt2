; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x454 ((_ extract 1 1) p0-join-read-23)))
(let (($x1195 (= ?x454 (_ bv0 1))))
(let (($x1178 (= (not (and (distinct (_ bv0 1) ?x454) true)) $x1195)))
(not $x1178)))))
(check-sat)
