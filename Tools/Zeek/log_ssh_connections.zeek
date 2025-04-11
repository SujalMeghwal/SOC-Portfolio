event connection_established(c: connection) {
    if (c$id$resp_p == 22/tcp) {
        print fmt("SSH Connection: %s -> %s", c$id$orig_h, c$id$resp_h);
    }
}
