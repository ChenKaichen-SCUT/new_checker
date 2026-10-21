; benchmark generated from python API
(set-info :status unknown)
(declare-fun |S1:656:response| () (_ BitVec 32))
(declare-fun |object:input_b| () (_ BitVec 64))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x59 (and (and true (and (distinct (ite (= (_ bv0 32) |S1:656:response|) (_ bv1 1) (_ bv0 1)) (_ bv0 1)) true)) (and true true true true true true true))))
(let (($x44 (and true (not (and (distinct |S1:656:response| (_ bv0 32)) true)))))
(let ((?x50 ((_ zero_extend 1) |object:input_b|)))
(let (($x125 (or (bvule (bvadd ?x50 (_ bv4 65)) ((_ zero_extend 1) |object:x|)) (bvule (bvadd ((_ zero_extend 1) |object:x|) (_ bv4 65)) ?x50))))
(let (($x70 (and (and (distinct |object:input_b| (_ bv0 64)) true) (= (bvand |object:input_b| (_ bv3 64)) (_ bv0 64)))))
(let (($x61 (and (and (distinct |object:input_b| |object:x|) true) $x70 (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))) $x125)))
(and $x61 $x44 (not (or $x59 false))))))))))
(check-sat)
