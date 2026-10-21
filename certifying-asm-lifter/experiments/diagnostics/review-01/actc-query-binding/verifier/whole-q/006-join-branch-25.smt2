; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x54 ((_ extract 1 1) p0-join-read-23)))
(let (($x44 (= ?x54 (_ bv0 1))))
(let (($x64 (= (not (and (distinct (_ bv0 1) ?x54) true)) $x44)))
(not $x64)))))
(check-sat)
