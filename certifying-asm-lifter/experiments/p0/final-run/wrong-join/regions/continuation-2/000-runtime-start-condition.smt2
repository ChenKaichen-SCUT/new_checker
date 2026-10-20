; benchmark generated from python API
(set-info :status unknown)
(declare-fun |context:__threadStateT2| () (_ BitVec 2))
(assert
 (and (distinct (and (distinct (_ bv0 1) ((_ extract 0 0) |context:__threadStateT2|)) true) (and (distinct ((_ extract 0 0) |context:__threadStateT2|) (_ bv0 1)) true)) true))
(check-sat)
