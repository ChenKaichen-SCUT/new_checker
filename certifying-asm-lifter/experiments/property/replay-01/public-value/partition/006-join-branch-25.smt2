; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x1718 ((_ extract 1 1) p0-join-read-23)))
(let (($x2525 (= ?x1718 (_ bv0 1))))
(let (($x580 (= (not (and (distinct (_ bv0 1) ?x1718) true)) $x2525)))
(not $x580)))))
(check-sat)
