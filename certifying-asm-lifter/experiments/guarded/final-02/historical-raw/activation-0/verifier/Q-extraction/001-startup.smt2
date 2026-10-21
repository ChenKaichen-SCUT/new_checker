; benchmark generated from python API
(set-info :status unknown)
(declare-fun start () (_ BitVec 2))
(assert
 (let (($x48 (= (and (distinct (_ bv0 1) ((_ extract 0 0) start)) true) (and (distinct ((_ extract 0 0) start) (_ bv0 1)) true))))
(not $x48)))
(check-sat)
