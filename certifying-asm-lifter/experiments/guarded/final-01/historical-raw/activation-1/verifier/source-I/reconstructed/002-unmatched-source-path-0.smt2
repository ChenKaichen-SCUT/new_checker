; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x33 (and true (and true true true true true true true true true))))
(let (($x42 (and (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x42 true (not (or $x33))))))
(check-sat)
