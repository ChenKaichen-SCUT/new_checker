; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x308 ((_ extract 1 1) p0-join-read-23)))
(let (($x7317 (= ?x308 (_ bv0 1))))
(let (($x8669 (= (not (and (distinct (_ bv0 1) ?x308) true)) $x7317)))
(not $x8669)))))
(check-sat)
