; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x3297 (and true (and true true true true true true true true true))))
(let (($x44 (and (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x44 true (not (or $x3297))))))
(check-sat)
