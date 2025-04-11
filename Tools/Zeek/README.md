# 🔰 Zeek Basic Rules for Beginners

This repo contains **very simple Zeek scripts** made for beginners who want to learn how Zeek works. These small rules help you see network activity like HTTP, DNS, and SSH — and also show how to create basic alerts.

---

## 📜 What Each Rule Does

| File Name                      | What It Does                              |
|-------------------------------|--------------------------------------------|
| log_http_requests.zeek        | Logs all HTTP requests (like websites)     |
| log_dns_queries.zeek          | Logs all DNS queries (like domain lookups) |
| alert_facebook_visit.zeek     | Alerts if someone goes to Facebook         |
| log_ssh_connections.zeek      | Logs any SSH connections (port 22)         |
| alert_google_dns.zeek         | Alerts if 8.8.8.8 is used (Google DNS)     |
| alert_clear_pass_http.zeek    | Detecting cleartext passwords in HTTP      |

---

## 🚀 How to Run the Rules

1. **Clone this repo**:
```bash
git clone https://github.com/SujalMeghwal/SOC-Portfolio/new/main/Tools/Zeek.git
```

2. **Run Zeek on a PCAP file** (for offline testing):
```bash
zeek -r yourfile.pcap local.zeek
```

3. **Run Zeek live on your network** (real-time monitoring):
```bash
sudo zeek -i eth0 local.zeek
```

✅ Replace `eth0` with your actual network interface name (use `ip a` to check).

---

## 👨‍🏫 Learn More

- 📘 [Zeek Docs (Official)](https://docs.zeek.org/en/current/)
- 🧪 Use PCAPs from [malware-traffic-analysis.net](https://www.malware-traffic-analysis.net/)
- 🎥 YouTube: Search “Zeek network monitoring basics”
