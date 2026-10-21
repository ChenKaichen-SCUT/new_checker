; benchmark generated from python API
(set-info :status unknown)
(declare-fun |S0:567:R:response| () (_ BitVec 32))
(declare-fun |object:x| () (_ BitVec 64))
(assert
 (let (($x3169 (= |S0:567:R:response| (_ bv7 32))))
(let (($x3251 (and (and (and (distinct |object:x| (_ bv0 64)) true) (= (bvand |object:x| (_ bv3 64)) (_ bv0 64))))))
(and (and $x3251 true (not (or false))) $x3169))))
(check-sat)
