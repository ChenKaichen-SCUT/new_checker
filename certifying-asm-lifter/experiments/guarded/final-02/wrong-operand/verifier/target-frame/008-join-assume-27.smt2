; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x152 ((_ extract 0 0) p0-join-read-23)))
(let (($x1128 (= ?x152 (_ bv0 1))))
(let (($x8830 (= (not (and (distinct (_ bv0 1) ?x152) true)) $x1128)))
(not $x8830)))))
(check-sat)
