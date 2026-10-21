; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x3201 ((_ extract 0 0) p0-join-read-23)))
(let (($x48 (= ?x3201 (_ bv0 1))))
(let (($x8098 (= (not (and (distinct (_ bv0 1) ?x3201) true)) $x48)))
(not $x8098)))))
(check-sat)
