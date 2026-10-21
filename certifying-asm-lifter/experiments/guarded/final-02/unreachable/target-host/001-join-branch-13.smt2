; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x557 ((_ extract 1 1) p0-join-read-11)))
(let (($x5939 (= ?x557 (_ bv0 1))))
(let (($x206 (= (not (and (distinct (_ bv0 1) ?x557) true)) $x5939)))
(not $x206)))))
(check-sat)
