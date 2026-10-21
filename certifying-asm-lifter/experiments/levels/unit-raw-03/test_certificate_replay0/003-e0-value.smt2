; benchmark generated from python API
(set-info :status unknown)
(declare-fun |in:desired| () (_ BitVec 32))
(declare-fun |in:expected| () (_ BitVec 32))
(declare-fun u0 () (_ BitVec 32))
(assert
 (let (($x30 (= u0 |in:expected|)))
(let (($x35 (=> $x30 (= |in:desired| |in:desired|))))
(not $x35))))
(check-sat)
