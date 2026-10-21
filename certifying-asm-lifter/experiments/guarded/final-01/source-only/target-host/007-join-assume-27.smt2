; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2395 ((_ extract 0 0) p0-join-read-23)))
(let (($x8421 (= ?x2395 (_ bv0 1))))
(let (($x3209 (= (not (and (distinct (_ bv0 1) ?x2395) true)) $x8421)))
(not $x3209)))))
(check-sat)
