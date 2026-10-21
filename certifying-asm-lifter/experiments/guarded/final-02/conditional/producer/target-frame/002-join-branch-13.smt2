; benchmark generated from python API
(set-info :status unknown)
(declare-fun p0-join-read-11 () (_ BitVec 2))
(assert
 (let ((?x206 ((_ extract 1 1) p0-join-read-11)))
(let (($x7781 (= ?x206 (_ bv0 1))))
(let (($x1813 (= (not (and (distinct (_ bv0 1) ?x206) true)) $x7781)))
(not $x1813)))))
(check-sat)
