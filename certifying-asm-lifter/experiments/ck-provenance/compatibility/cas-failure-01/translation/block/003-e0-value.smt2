; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:v2| () (_ BitVec 32))
(declare-fun |in:v0| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x77 (= u0 |in:v0|)))
(let (($x5 (=> $x77 (= |in:v2| |in:v2|))))
(not $x5))))
(check-sat)
