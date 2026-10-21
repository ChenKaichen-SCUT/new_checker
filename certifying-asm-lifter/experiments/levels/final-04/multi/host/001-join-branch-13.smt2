; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x86 ((_ extract 1 1) p0-join-read-11)))
(let (($x48 (= ?x86 (_ bv0 1))))
(let (($x75 (= (not (and (distinct (_ bv0 1) ?x86) true)) $x48)))
(not $x75)))))
(check-sat)
