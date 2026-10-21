; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x6027 ((_ extract 1 1) p0-join-read-23)))
(let (($x28 (= ?x6027 (_ bv0 1))))
(let (($x214 (= (not (and (distinct (_ bv0 1) ?x6027) true)) $x28)))
(not $x214)))))
(check-sat)
