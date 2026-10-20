; benchmark generated from python API
(set-info :status unknown)
(declare-fun |context:__threadStateT2| () (_ BitVec 2))
(assert
 (let ((?x17 (bvand |context:__threadStateT2| (_ bv2 2))))
(and (distinct ?x17 ?x17) true)))
(check-sat)
