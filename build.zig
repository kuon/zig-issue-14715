const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = .ReleaseSafe,
    });

    const step = b.step("lib", "Compile library");

    const lib = b.addSharedLibrary(.{
        .name = "testlib",
        .root_source_file = .{ .path = "./src/main.zig" },
        .optimize = optimize,
        .target = .{},
    });

    lib.setOutputDir(".");
    lib.install();
    lib.linkLibC();
    step.dependOn(&lib.step);
}
