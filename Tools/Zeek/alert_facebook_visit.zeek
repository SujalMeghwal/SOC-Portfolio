event http_request(c: connection, method: string, original_URI: string, unescaped_URI: string, version: string) {
    if (c$http$host == "www.facebook.com") {
        print fmt("ALERT: Someone visited Facebook -> %s", c$id$orig_h);
    }
}
