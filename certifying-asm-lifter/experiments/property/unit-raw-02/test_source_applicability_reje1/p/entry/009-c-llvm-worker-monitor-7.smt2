; benchmark generated from python API
(set-info :status unknown)
(declare-fun |source-create-1:p1-open-read-2| () (_ BitVec 32))
(assert
 (let (($x110 (and (distinct (_ bv0 32) |source-create-1:p1-open-read-2|) true)))
(let ((?x102 (ite $x110 (_ bv1 1) (_ bv0 1))))
(let ((?x64 ((_ zero_extend 31) ?x102)))
(let (($x86 (= $x110 (and (distinct ?x64 (_ bv0 32)) true))))
(not $x86))))))
(check-sat)
