; benchmark generated from python API
(set-info :status unknown)
(declare-fun s-r () (_ BitVec 32))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x63 (= s-r (_ bv0 32))))
(let (($x133 (= $x63 (= s-r (_ bv1 32)))))
(let (($x57 (not $x133)))
(let (($x13 (and (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x13 $x57))))))
(check-sat)
