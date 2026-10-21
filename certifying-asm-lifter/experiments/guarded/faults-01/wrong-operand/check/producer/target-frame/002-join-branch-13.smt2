; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x47 ((_ extract 1 1) p0-join-read-11)))
(let (($x179 (= ?x47 (_ bv0 1))))
(let (($x73 (= (not (and (distinct (_ bv0 1) ?x47) true)) $x179)))
(not $x73)))))
(check-sat)
