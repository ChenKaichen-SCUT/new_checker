; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x240 ((_ extract 1 1) p0-join-read-23)))
(let (($x64 (= ?x240 (_ bv0 1))))
(let (($x153 (= (not (and (distinct (_ bv0 1) ?x240) true)) $x64)))
(not $x153)))))
(check-sat)
