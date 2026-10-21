; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x1622 ((_ extract 1 1) p0-join-read-11)))
(let (($x2666 (= ?x1622 (_ bv0 1))))
(let (($x580 (= (not (and (distinct (_ bv0 1) ?x1622) true)) $x2666)))
(not $x580)))))
(check-sat)
