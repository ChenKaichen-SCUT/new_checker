; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x137 ((_ extract 1 1) p0-join-read-23)))
(let (($x138 (= ?x137 (_ bv0 1))))
(let (($x136 (= (not (and (distinct (_ bv0 1) ?x137) true)) $x138)))
(not $x136)))))
(check-sat)
