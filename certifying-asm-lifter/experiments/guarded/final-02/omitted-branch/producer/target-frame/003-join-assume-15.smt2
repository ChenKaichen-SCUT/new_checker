; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x2829 ((_ extract 0 0) p0-join-read-11)))
(let (($x3175 (= ?x2829 (_ bv0 1))))
(let (($x16 (= (not (and (distinct (_ bv0 1) ?x2829) true)) $x3175)))
(not $x16)))))
(check-sat)
