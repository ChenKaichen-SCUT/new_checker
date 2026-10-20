; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-2:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |activation-2:p1-open-rmw-3| () (_ BitVec 32))
(assert
 (let ((?x51 (bvadd |activation-2:p1-open-rmw-3| |activation-2:p1-open-rmw-1|)))
(let (($x36 (= ?x51 ?x51)))
(not $x36))))
(check-sat)
