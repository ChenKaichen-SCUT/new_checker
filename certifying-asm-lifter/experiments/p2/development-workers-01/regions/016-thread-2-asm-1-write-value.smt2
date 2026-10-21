; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-read-0| () (_ BitVec 32))
(declare-fun |activation-2:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let ((?x47 (bvadd |activation-2:p1-open-rmw-1| |activation-2:p1-open-read-0|)))
(let (($x54 (= ?x47 ?x47)))
(not $x54))))
(check-sat)
