; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-23 () (_ BitVec 2))
(assert
 (let ((?x405 ((_ extract 0 0) p0-join-read-23)))
(let (($x401 (= ?x405 (_ bv0 1))))
(let (($x2935 (= (not (and (distinct (_ bv0 1) ?x405) true)) $x401)))
(not $x2935)))))
(check-sat)
