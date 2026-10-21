; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x421 ((_ extract 0 0) p0-join-read-11)))
(let (($x581 (= ?x421 (_ bv0 1))))
(let (($x424 (= (not (and (distinct (_ bv0 1) ?x421) true)) $x581)))
(not $x424)))))
(check-sat)
