const std = @import("std");
const meta = std.meta;
const mem = std.mem;

pub const Data = struct {
    foo: ?[]const u8,
};

pub fn main() !void {
    do_something();
}

export fn do_something() void {
    var data: Data = mem.zeroes(Data);

    populate(&data) catch unreachable;
    std.debug.print("bug: {any}\n", .{data});
}

fn populate(dest: anytype) !void {
    const T = @TypeOf(dest.*);
    switch (@typeInfo(T)) {
        .Struct => {
            const key = "foo";

            inline for (comptime meta.fieldNames(T)) |f| {
                if (mem.eql(u8, f, key)) {
                    try populate(&@field(dest, f));
                }
            }
        },
        .Optional => |O| {
            dest.* = mem.zeroes(O.child);
            try populate(&dest.*.?);
            return;
        },
        .Pointer => |ptr_info| {
            switch (ptr_info.size) {
                .Slice => {
                    if (ptr_info.child == u8) {
                        dest.* = "hello";
                    }
                    return;
                },
                else => return error.UnsupportedType,
            }
        },
        else => return error.UnsupportedType,
    }
}
