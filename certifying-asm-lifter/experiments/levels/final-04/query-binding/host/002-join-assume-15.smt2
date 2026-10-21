; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x64 ((_ extract 0 0) p0-join-read-11)))
(let (($x52 (= ?x64 (_ bv0 1))))
(let (($x61 (= (not (and (distinct (_ bv0 1) ?x64) true)) $x52)))
(not $x61)))))
(check-sat)
