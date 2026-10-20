; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |activation-1:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let ((?x54 (bvadd |activation-1:p1-open-rmw-3| |activation-1:p1-open-rmw-1|)))
(let (($x49 (= ?x54 ?x54)))
(not $x49))))
(check-sat)
