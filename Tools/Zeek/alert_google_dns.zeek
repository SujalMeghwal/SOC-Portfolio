event new_connection(c: connection) {
    if (c$id$resp_h == 8.8.8.8) {
        print fmt("Google DNS Accessed: %s -> 8.8.8.8", c$id$orig_h);
    }
}
