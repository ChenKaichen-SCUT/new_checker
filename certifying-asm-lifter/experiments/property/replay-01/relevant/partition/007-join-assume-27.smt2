; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x16 ((_ extract 0 0) p0-join-read-23)))
(let (($x76 (= ?x16 (_ bv0 1))))
(let (($x484 (= (not (and (distinct (_ bv0 1) ?x16) true)) $x76)))
(not $x484)))))
(check-sat)
