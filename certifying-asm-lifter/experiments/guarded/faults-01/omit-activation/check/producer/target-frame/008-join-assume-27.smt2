; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x98 ((_ extract 0 0) p0-join-read-23)))
(let (($x3873 (= ?x98 (_ bv0 1))))
(let (($x8511 (= (not (and (distinct (_ bv0 1) ?x98) true)) $x3873)))
(not $x8511)))))
(check-sat)
