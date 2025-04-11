event dns_request(c: connection, query: string) {
    print fmt("DNS Request: %s", query);
}
