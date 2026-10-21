; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let ((?x55 (bvadd |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-read-0|)))
(let (($x18 (= ?x55 ?x55)))
(not $x18))))
(check-sat)
