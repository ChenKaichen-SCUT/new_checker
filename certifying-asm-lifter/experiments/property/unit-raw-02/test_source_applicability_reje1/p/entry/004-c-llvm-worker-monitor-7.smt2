; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-0:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x57 (and (distinct (_ bv0 32) |source-create-0:p1-open-read-2|) true)))
(let ((?x64 (ite $x57 (_ bv1 1) (_ bv0 1))))
(let ((?x58 ((_ zero_extend 31) ?x64)))
(let (($x47 (= $x57 (and (distinct ?x58 (_ bv0 32)) true))))
(not $x47))))))
(check-sat)
