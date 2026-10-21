; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(assert
 (let ((?x33 (bvadd |pd-source-1:p1-open-rmw-1| |pd-source-1:p1-open-read-0|)))
(let (($x85 (= ?x33 ?x33)))
(not $x85))))
(check-sat)
