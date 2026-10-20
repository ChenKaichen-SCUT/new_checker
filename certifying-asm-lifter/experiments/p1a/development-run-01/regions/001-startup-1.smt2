; benchmark generated from python API
(set-info :status unknown)
(declare-fun startup () (_ BitVec 2))
(declare-fun completion () (_ BitVec 2))
(assert
 (let (($x42 (= (and (distinct (_ bv0 1) ((_ extract 0 0) completion)) true) (and (distinct ((_ extract 0 0) startup) (_ bv0 1)) true))))
(not $x42)))
(check-sat)
