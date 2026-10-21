; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x46 ((_ extract 0 0) p0-join-read-23)))
(let (($x145 (= ?x46 (_ bv0 1))))
(let (($x64 (= (not (and (distinct (_ bv0 1) ?x46) true)) $x145)))
(not $x64)))))
(check-sat)
