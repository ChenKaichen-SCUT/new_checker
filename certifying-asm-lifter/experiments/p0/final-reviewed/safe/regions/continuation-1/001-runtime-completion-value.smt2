; benchmark generated from python API
(set-info :status unknown)
(declare-fun |context:__threadStateT1| () (_ BitVec 2))
(assert
 (let ((?x21 (bvand |context:__threadStateT1| (_ bv2 2))))
(and (distinct ?x21 ?x21) true)))
(check-sat)
