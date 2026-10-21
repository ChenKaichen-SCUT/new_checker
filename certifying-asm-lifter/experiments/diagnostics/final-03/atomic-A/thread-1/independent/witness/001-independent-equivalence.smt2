; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:input_a| () (_ BitVec 64))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x70 (and true true true true true true true true true true true true true true true true true true true true)))
(let ((?x69 ((_ zero_extend 1) |object:input_a|)))
(let (($x160 (or (bvule (bvadd ?x69 (_ bv4 65)) ((_ zero_extend 1) |object:x|)) (bvule (bvadd ((_ zero_extend 1) |object:x|) (_ bv4 65)) ?x69))))
(let (($x45 (and (and (distinct |object:input_a| (_ bv0 64)) true) (= (bvand |object:input_a| (_ bv3 64)) (_ bv0 64)))))
(let (($x95 (and (and (distinct |object:input_a| |object:x|) true) $x45 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))) $x160)))
(and $x95 (not $x70))))))))
(check-sat)
