; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(assert
 (let ((?x18 (bvadd |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-1|)))
(let ((?x79 (bvadd |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-read-0|)))
(let (($x62 (= ?x79 ?x18)))
(not $x62)))))
(check-sat)
