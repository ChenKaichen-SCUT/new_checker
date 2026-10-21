; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x72 ((_ extract 1 1) p0-join-read-23)))
(let (($x64 (= ?x72 (_ bv0 1))))
(let (($x22 (= (not (and (distinct (_ bv0 1) ?x72) true)) $x64)))
(not $x22)))))
(check-sat)
