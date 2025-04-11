# 🛡️ Diamond Model Report – Ransomware Attack on French Regional Hospital (March 2024)

## 💠 Adversary
- **Name**: Unknown (Black Basta affiliate)
- **Type**: Financially motivated cybercriminal group
- **Operator**: Independent threat actor leveraging Ransomware-as-a-Service (RaaS)
- **Motivation**: Extortion and monetary gain
- **Attribution Confidence**: Medium (based on malware artifacts and C2 infrastructure)

---

## 🧠 Capability
- **Malware**: Black Basta ransomware variant
- **Initial Access**: Spear-phishing via malicious PDF (embedded exploit)
- **Exploitation**: PDF reader vulnerability (CVE-XXXX-YYYY)
- **Execution**: Shellcode > reverse shell > PowerShell payload
- **Persistence**: Local admin account creation, scheduled tasks
- **Lateral Movement**: Credential dumping (LSASS), RDP pivoting
- **Impact**:
  - Data encryption
  - Exfiltration of 40 GB of sensitive records
  - Disruption of medical services
- **Ransom Demand**: €2.5M in Monero within 96 hours

---

## 🌐 Infrastructure
- **Initial C2 Server**: `185.203.118.144` (bulletproof hosted in Moldova)
- **Staging Server**: Compromised medical supplier site in Romania
- **Exfiltration Channel**: Encrypted HTTPS tunnel to VPS in Russia
- **Phishing Domain**: `hr-careers[.]fr` (spoofed)
- **Stolen Email Used**: `hr.admin@hospital-france[.]org`

---

## 🏥 Victim
- **Organization**: Regional Hospital, Southern France
- **Persona**: Public healthcare provider, critical infrastructure
- **Assets Targeted**:
  - Active Directory Domain Controllers
  - EMR (Electronic Medical Records) systems
  - Radiology imaging servers
  - ICU monitoring equipment
  - HR & Finance Department endpoints
- **Impact Summary**:
  - System-wide encryption in 5 departments
  - 7-day disruption in ICU and ER operations
  - Forced emergency redirection of patients
  - Triggered GDPR investigation

---

## 🧭 Optional Axes

### Social/Political Context
- Surge in healthcare-targeting ransomware post-COVID
- Increased vulnerabilities due to outdated hospital IT infrastructure

### Technology Context
- Unpatched software vulnerability in PDF reader allowed easy exploitation
- Weak endpoint defense (no EDR or anomaly detection)

---

## 📎 Appendix: Indicators of Compromise (IOCs)

| Type        | Value                         |
|-------------|-------------------------------|
| IP Address  | 185.203.118.144               |
| Domain      | hr-careers[.]fr               |
| Email       | hr.admin@hospital-france.org  |
| Hash (SHA256) | `e3b0c44298fc1c149afbf4c8996fb924...` |
| CVE         | CVE-XXXX-YYYY                 |

---

## 🧩 Suggested Mitigations
- Patch all document rendering software (e.g., Adobe Reader, Foxit)
- Block outbound HTTPS to known C2 networks (e.g., Moldova VPS ranges)
- Enforce 2FA across HR and finance departments
- Segment EMR systems from general IT infrastructure
- Implement anomaly-based EDR and real-time alerting

---

*Created by: [Your Name or Handle]*  
*Date: April 2025*  
*License: TLP:WHITE (Public Use Permitted)*
