; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v2| () (_ BitVec 32))
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x21 (= u0 |in:v0|)))
(let (($x44 (=> $x21 (= |in:v2| |in:v2|))))
(not $x44))))
(check-sat)
