; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x86 ((_ extract 1 1) p0-join-read-23)))
(let (($x8 (= ?x86 (_ bv0 1))))
(let (($x139 (= (not (and (distinct (_ bv0 1) ?x86) true)) $x8)))
(not $x139)))))
(check-sat)
