event http_request(c: connection, method: string, original_URI: string, unescaped_URI: string, version: string) {
    print fmt("HTTP Request: %s %s", method, original_URI);
}
