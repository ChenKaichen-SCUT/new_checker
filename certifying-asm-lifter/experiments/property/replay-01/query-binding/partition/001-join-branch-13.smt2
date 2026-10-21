; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2557 ((_ extract 1 1) p0-join-read-11)))
(let (($x431 (= ?x2557 (_ bv0 1))))
(let (($x1496 (= (not (and (distinct (_ bv0 1) ?x2557) true)) $x431)))
(not $x1496)))))
(check-sat)
