; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x122 ((_ extract 0 0) p0-join-read-23)))
(let (($x100 (= ?x122 (_ bv0 1))))
(let (($x142 (= (not (and (distinct (_ bv0 1) ?x122) true)) $x100)))
(not $x142)))))
(check-sat)
