; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x213 ((_ extract 1 1) p0-join-read-23)))
(let (($x28 (= ?x213 (_ bv0 1))))
(let (($x46 (= (not (and (distinct (_ bv0 1) ?x213) true)) $x28)))
(not $x46)))))
(check-sat)
