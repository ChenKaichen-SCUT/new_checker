; benchmark generated from python API
(set-info :status unknown)
(declare-fun |context:__threadStateT1| () (_ BitVec 2))
(assert
 (let ((?x7 (bvand |context:__threadStateT1| (_ bv2 2))))
(and (distinct ?x7 ?x7) true)))
(check-sat)
