# zig-issue-14715

https://github.com/ziglang/zig/issues/14715

## To reproduce

`make`

zig version: `0.11.0-dev.1825+25b83188d0`
llvm version: `15.0.7`


build output:

```
LLVM Emit Object... invalid base type
!2226 = !DIDerivedType(tag: DW_TAG_member, name: "foo", scope: !2224, baseType: zig: /home/kuon/Repos/aur/llvm15/src/llvm-project/llvm/include/llvm/Support/Casting.h:578: decltype(auto) llvm::cast(From*) [with To = ValueAsMetadata; From = const Metadata]: Assertion `isa<To>(Val) && "cast<Ty>() argument of incompatible type!"' failed.
error: testlib...
error: The following command terminated unexpectedly:
/usr/bin/zig build-lib /home/kuon/Playground/zig-bug/src/main.zig -lc --cache-dir /home/kuon/Playground/zig-bug/zig-cache --global-cache-dir /home/kuon/.cache/zig --name testlib -dynamic --enable-cache
error: the following build command failed with exit code 6:
/home/kuon/Playground/zig-bug/zig-cache/o/7b9a80eff9b4244ab84d381cc90d0edb/build /usr/bin/zig /home/kuon/Playground/zig-bug /home/kuon/Playground/zig-bug/zig-cache /home/kuon/.cache/zig lib
make: *** [Makefile:4: build] Error 1

```
