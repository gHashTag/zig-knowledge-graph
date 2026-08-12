const std = @import("std");

// There was no build.zig in this repository at all. Three source files, fifteen
// test blocks, a manifest declaring a dependency without a hash — and nothing
// that could compile any of it.
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const golden = b.dependency("zig_golden_float", .{
        .target = target,
        .optimize = optimize,
    }).module("golden-float");

    const kg_mod = b.addModule("zig-knowledge-graph", .{
        .root_source_file = b.path("src/knowledge_graph.zig"),
        .target = target,
        .optimize = optimize,
    });
    kg_mod.addImport("zig_golden_float", golden);

    // kg_cli and kg_server are NOT built. Both were written against Zig 0.14
    // and never migrated: std.io.getStdOut is gone, std.ArrayList is unmanaged
    // so .init(allocator) and one-argument .append no longer exist, and
    // http.Server.init takes a reader rather than a connection. That is a
    // migration across roughly 1300 lines with many call sites, and it is
    // tracked separately.
    //
    // The library is the part other packages depend on, and it is what this
    // change makes usable. Building the two binaries would keep the whole
    // package unbuildable for the sake of two tools that have never run.

    // Each root gets its own test target. A single root would reach only what it
    // references, and under Zig's lazy analysis an unreferenced import is not a
    // weakly-checked file — it is an absent one, along with its test blocks.
    const test_step = b.step("test", "Run tests");
    inline for (.{
        .{ "knowledge_graph", "src/knowledge_graph.zig" },
    }) |t| {
        const tm = b.createModule(.{
            .root_source_file = b.path(t[1]),
            .target = target,
            .optimize = optimize,
        });
        tm.addImport("zig_golden_float", golden);
        test_step.dependOn(&b.addRunArtifact(b.addTest(.{ .name = t[0], .root_module = tm })).step);
    }
}
