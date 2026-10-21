; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x2935 ((_ extract 1 1) p0-join-read-23)))
(let (($x735 (= ?x2935 (_ bv0 1))))
(let (($x2922 (= (not (and (distinct (_ bv0 1) ?x2935) true)) $x735)))
(not $x2922)))))
(check-sat)
