; benchmark generated from python API
(set-info :status unknown)
(declare-fun s-r () (_ BitVec 32))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x63 (= s-r (_ bv0 32))))
(let (($x15 (= $x63 (= s-r (_ bv1 32)))))
(let (($x33 (and true true true true true true true $x15 true true true true true true)))
(let (($x34 (and (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x34 (not $x33)))))))
(check-sat)
