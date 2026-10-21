; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x143 ((_ extract 1 1) p0-join-read-11)))
(let (($x146 (= ?x143 (_ bv0 1))))
(let (($x144 (= (not (and (distinct (_ bv0 1) ?x143) true)) $x146)))
(not $x144)))))
(check-sat)
