# 🛡️ Diamond Model Report – Ransomware Attack on Lyon Hospital (March 2024)

## 🔷 Adversary

- **Name:** Unknown actor (suspected Black Basta Ransomware affiliate)
- **Type:** Financially motivated cybercriminal
- **Operator:** Likely individual or small group leveraging Ransomware-as-a-Service (RaaS)
- **Customer:** Possibly part of a broader organized cybercrime group
- **Motivation:** Financial gain via extortion (ransom demand)
- **Attribution Confidence:** Medium
  - Based on malware analysis, TTPs, and infrastructure overlaps

---

## 🛠️ Capability

- **Initial Access:**
  - Spear-phishing email with malicious PDF attachment
  - Spoofed identity of trusted medical supplier
- **Exploitation:**
  - Vulnerability in hospital’s PDF reader software (possible known CVE)
- **Execution and Lateral Movement:**
  - Reverse shell established to remote C2
  - PowerShell scripts used for lateral movement
  - Credential harvesting from memory (LSASS)
  - Creation of local admin accounts for persistence
- **Malware Deployed:**
  - Black Basta ransomware (custom variant)
- **Exfiltration:**
  - Over 40 GB of patient records stolen over HTTPS to a VPS in Russia
- **Impact:**
  - 70% of hospital systems encrypted
  - Disruption of critical services (e.g., MRI, critical care)
  - Ransom demand: €2.5 million in Monero within 96 hours

---

## 🌐 Infrastructure

- **C2 Infrastructure:**
  - VPS hosted in Moldova (IP: `185.203.118.144`)
- **Phishing Domain:**
  - `hr-careers[.]fr` — fake domain spoofing trusted contact
- **Staging Server:**
  - Compromised Romanian medical supplier website
- **Exfiltration Endpoint:**
  - VPS located in Russia, receiving stolen data via HTTPS
- **Infrastructure Types:**
  - **Type 1:** Actor-owned VPS, phishing domain
  - **Type 2:** Compromised third-party site used as intermediary
- **Service Providers Involved:**
  - Hosting providers (Moldova, Russia)
  - Domain registrars
  - Compromised webmail system (used for phishing)

---

## 🎯 Victim

- **Organization:** Public Regional Hospital, Lyon, France
- **Sector:** Healthcare
- **Victim Persona:**
  - Medical professionals
  - Public hospital staff
  - Critical infrastructure operators
- **Victim Assets:**
  - Internal Windows domain network
  - Patient records and EMR database servers
  - MRI scheduling systems and endpoints
  - VPN appliances and email servers
  - Vulnerable third-party PDF reader

---

## 📌 Summary

A ransomware operator, suspected to be affiliated with Black Basta, targeted a public hospital in Lyon through a spear-phishing email. After exploiting a PDF vulnerability, the attacker gained access, moved laterally, and deployed ransomware, severely impacting hospital operations and demanding ransom in Monero. Data was exfiltrated to foreign infrastructure, with strong indicators of both Type 1 and Type 2 infrastructure usage. The incident highlights the intersection of healthcare vulnerability and financially driven APT-level threats.
