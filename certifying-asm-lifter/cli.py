import argparse
import json
from pathlib import Path
from frontend.gnu import parse, Reject
from lifter.lift import lift
from checker.check import check


def main():
    p = argparse.ArgumentParser(description="Restricted open-event GNU asm certifier")
    p.add_argument("source", type=Path)
    p.add_argument("--width", type=int, default=32)
    p.add_argument("--target", type=Path, help="independently check this candidate IR")
    p.add_argument("--out", type=Path, default=Path("certificates/latest"))
    args = p.parse_args()
    text = args.source.read_text(encoding="utf-8")
    try:
        ir = json.loads(args.target.read_text(encoding="utf-8")) if args.target else lift(parse(text, args.width))
        args.out.mkdir(parents=True, exist_ok=True)
        (args.out / "target.json").write_text(json.dumps(ir, indent=2), encoding="utf-8")
        result = check(text, ir, args.width, output_dir=args.out)
    except (Reject, ValueError) as e:
        result = {"result": "REJECT", "reason": str(e)}
    print(json.dumps(result, indent=2, ensure_ascii=False))
    return 0 if result["result"] == "EXACT" else 2


if __name__ == "__main__":
    raise SystemExit(main())
