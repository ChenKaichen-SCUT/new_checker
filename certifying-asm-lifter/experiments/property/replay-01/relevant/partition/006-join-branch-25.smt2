; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x161 ((_ extract 1 1) p0-join-read-23)))
(let (($x63 (= ?x161 (_ bv0 1))))
(let (($x66 (= (not (and (distinct (_ bv0 1) ?x161) true)) $x63)))
(not $x66)))))
(check-sat)
