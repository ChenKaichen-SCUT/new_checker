"""OS launch adaptation only. No expression, certificate or model semantics.

On Linux, remove the legacy WSL transport prefix. Optionally use the original
Clang's private ELF loader/runtime on an older distribution; preserve the
compiler bytes and arguments. Commands records both requested/executed argv.
"""
import os


def native_args(args):
    args = [str(a) for a in args]
    if os.name == 'nt':
        return args
    if args[:3] == ['wsl', '-d', 'Ubuntu'] and len(args) > 4 and args[3] in {'--', '--exec'}:
        args = args[4:]
    elif args and args[0] == 'wsl':
        raise ValueError('unsupported legacy transport prefix')
    i = 0
    if args and args[0] == 'env':
        i = 1
        while i < len(args) and '=' in args[i] and not args[i].startswith('/'):
            i += 1
    loader = os.environ.get('ACTC_CLANG_LOADER')
    libraries = os.environ.get('ACTC_CLANG_RUNTIME')
    if loader and i < len(args) and os.path.basename(args[i]) in {'clang-21', 'clang++-21'}:
        if not libraries:
            raise ValueError('private Clang loader requires explicit runtime path')
        args[i:i] = [loader, '--library-path', libraries]
        if '-cc1' not in args:
            args.append('-fintegrated-cc1')
        resource = os.environ.get('ACTC_CLANG_RESOURCE_DIR')
        if resource:
            args.extend(['-resource-dir', resource])
    return args
