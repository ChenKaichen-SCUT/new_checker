; benchmark generated from python API
(set-info :status unknown)
(declare-fun |pd-source-1:p1-open-rmw-1| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-0| () (_ BitVec 32))
(declare-fun |pd-source-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let ((?x444 (ite (= (ite (= (_ bv2 32) |pd-source-1:p1-open-read-2|) (_ bv1 1) (_ bv0 1)) (_ bv1 1)) |pd-source-1:p1-open-read-0| (_ bv0 32))))
(let (($x2144 (= (_ bv2 32) |pd-source-1:p1-open-read-2|)))
(let ((?x389 (ite $x2144 (bvadd |pd-source-1:p1-open-read-0| |pd-source-1:p1-open-rmw-1|) |pd-source-1:p1-open-rmw-1|)))
(let (($x400 (= ?x389 (bvadd ?x444 |pd-source-1:p1-open-rmw-1|))))
(not $x400))))))
(check-sat)
