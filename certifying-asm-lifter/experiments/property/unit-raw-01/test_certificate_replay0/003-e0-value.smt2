; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:desired| () (_ BitVec 32))
(declare-fun |in:expected| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x19 (= u0 |in:expected|)))
(let (($x43 (=> $x19 (= |in:desired| |in:desired|))))
(not $x43))))
(check-sat)
