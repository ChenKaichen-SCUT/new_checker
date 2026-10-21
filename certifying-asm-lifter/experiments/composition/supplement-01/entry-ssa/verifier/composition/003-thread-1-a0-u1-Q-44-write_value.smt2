; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(assert
 (let ((?x147 (bvadd |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-rmw-1|)))
(let ((?x55 (bvadd |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-read-0|)))
(let (($x118 (= ?x55 ?x147)))
(not $x118)))))
(check-sat)
