; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-read-0| () (_ BitVec 32))
(declare-fun |activation-2:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let ((?x38 (bvadd |activation-2:p1-open-rmw-1| |activation-2:p1-open-read-0|)))
(let (($x12 (= ?x38 ?x38)))
(not $x12))))
(check-sat)
