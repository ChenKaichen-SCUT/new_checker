; benchmark generated from python API
(set-info :status unknown)
(declare-fun startup () (_ BitVec 2))
(assert
 (let (($x23 (= (and (distinct (_ bv0 1) ((_ extract 0 0) startup)) true) (and (distinct ((_ extract 0 0) startup) (_ bv0 1)) true))))
(not $x23)))
(check-sat)
