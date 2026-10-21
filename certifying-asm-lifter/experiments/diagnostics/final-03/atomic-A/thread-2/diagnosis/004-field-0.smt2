; benchmark generated from python API
(set-info :status unknown)
(declare-fun |object:side| () (_ BitVec 64))
(declare-fun |object:input_b| () (_ BitVec 64))
(assert
 (let (($x36 (= |object:input_b| |object:side|)))
(let (($x2042 (not $x36)))
(let ((?x43 ((_ zero_extend 1) |object:input_b|)))
(let (($x7 (or (bvule (bvadd ?x43 (_ bv4 65)) ((_ zero_extend 1) |object:side|)) (bvule (bvadd ((_ zero_extend 1) |object:side|) (_ bv4 65)) ?x43))))
(let (($x46 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(let (($x18 (and (and (distinct |object:input_b| |object:side|) true) $x46 (and (and (distinct |object:side| (_ bv0 64)) true) (= (bvand |object:side| (_ bv3 64)) (_ bv0 64))) $x7)))
(and $x18 $x2042))))))))
(check-sat)
