; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |activation-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let ((?x15 (bvadd |activation-1:p1-open-rmw-1| |activation-1:p1-open-read-0|)))
(let (($x14 (= ?x15 ?x15)))
(not $x14))))
(check-sat)
