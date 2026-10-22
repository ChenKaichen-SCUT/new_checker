"""Seal and verify every new public byte; no target-tool invocation."""
import hashlib
from pathlib import Path
from semantic_testing.run import save,load
from semantic_testing.dsl import require

ROOTS=('relation_synthesis','docs/relation-synthesis','experiments/relation-synthesis')
OUTPUT=Path('experiments/relation-synthesis/integrity.json')


def entries():
    result={}
    for root in ROOTS:
        for p in sorted(Path(root).rglob('*')):
            if not p.is_file() or '__pycache__' in p.parts or p==OUTPUT: continue
            b=p.read_bytes(); result[p.as_posix()]=dict(bytes=len(b),sha256=hashlib.sha256(b).hexdigest())
    return result


def run(verify=False):
    actual=entries()
    if verify:
        frozen=load(OUTPUT)
        require(frozen['files']==actual,'PUBLICATION_BYTE_MISMATCH')
        print('VERIFIED',len(actual),'files',sum(x['bytes'] for x in actual.values()),'bytes')
    else:
        save(OUTPUT,dict(schema='relation-publication-1',baseline='4ffe20639ea376485e04a7d545e84776233e80d1',
            roots=ROOTS,excluded=['__pycache__','integrity manifest itself'],files=actual))
        print('SEALED',len(actual),'files',sum(x['bytes'] for x in actual.values()),'bytes')


if __name__=='__main__':
    import sys
    run('--verify' in sys.argv)
