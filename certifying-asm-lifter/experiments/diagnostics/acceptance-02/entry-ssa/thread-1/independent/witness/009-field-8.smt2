; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:x| () (_ BitVec 64))
(declare-fun |object:input_a| () (_ BitVec 64))
(assert
 (let (($x98 (= |object:input_a| |object:x|)))
(let (($x197 (not $x98)))
(let (($x190 (and (and (distinct |object:input_a| (_ bv0 64)) true) (= (bvand |object:input_a| (_ bv3 64)) (_ bv0 64)))))
(let (($x128 (and (and (distinct |object:input_a| |object:x|) true) $x190 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and $x128 $x197))))))
(check-sat)
