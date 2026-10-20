; benchmark generated from python API
(set-info :status unknown)
(declare-fun |activation-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |activation-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let ((?x30 (bvadd |activation-1:p1-open-rmw-1| |activation-1:p1-open-read-0|)))
(let (($x16 (= ?x30 ?x30)))
(not $x16))))
(check-sat)
