; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x254 ((_ extract 0 0) p0-join-read-23)))
(let (($x1200 (= ?x254 (_ bv0 1))))
(let (($x2586 (= (not (and (distinct (_ bv0 1) ?x254) true)) $x1200)))
(not $x2586)))))
(check-sat)
