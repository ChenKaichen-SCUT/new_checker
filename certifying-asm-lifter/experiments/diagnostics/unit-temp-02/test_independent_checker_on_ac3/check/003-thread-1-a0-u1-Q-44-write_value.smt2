; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-0:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-0:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let ((?x79 (bvadd |pd-source-0:p1-open-rmw-1| |pd-source-0:p1-open-read-0|)))
(let (($x132 (= ?x79 ?x79)))
(not $x132))))
(check-sat)
