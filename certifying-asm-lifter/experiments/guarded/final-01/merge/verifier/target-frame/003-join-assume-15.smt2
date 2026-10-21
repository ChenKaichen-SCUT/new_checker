; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x3214 ((_ extract 0 0) p0-join-read-11)))
(let (($x3175 (= ?x3214 (_ bv0 1))))
(let (($x127 (= (not (and (distinct (_ bv0 1) ?x3214) true)) $x3175)))
(not $x127)))))
(check-sat)
