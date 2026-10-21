; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x8634 ((_ extract 0 0) p0-join-read-23)))
(let (($x41 (= ?x8634 (_ bv0 1))))
(let (($x4537 (= (not (and (distinct (_ bv0 1) ?x8634) true)) $x41)))
(not $x4537)))))
(check-sat)
