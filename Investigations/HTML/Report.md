████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████

🚨 SUS ACTIVITY DETECTED — HOST: IEWIN7 — CHAINED LOLBIN ATTACK USING `mshta.exe` + `dllhost.exe`

🕒 Timeline: 6/15/2019 7:13:42 AM → 7:14:32 AM  
👤 User: IEWIN7\IEUser  
🖥️ Host IP: 10.0.2.13  

────────────────────────────────────────────────────────────────────────────

🔥 1. MALICIOUS USE OF `mshta.exe` TO RUN `.hta` PAYLOAD FROM INTERNET CACHE

➤ CommandLine:  
"C:\Windows\System32\mshta.exe" "C:\Users\IEUser\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5\S97WTYG7\update.hta"

⚠️ Flags:
- HTA file dropped into `Temporary Internet Files` → **auto-cleared, high-risk zone**
- `.hta` = **HTML Application** (JS/VBS) → known vector for **phishing/malware**
- mshta is a classic **LOLBIN** abused to execute scripts **without dropping .exe**
- Event shows weird `CommandLine: C:\Users\IEUser\Desktop\` → looks overwritten or **telemetry spoofed**
- HTA filename = `update.hta` → common in fake update scams
![Screenshot 2025-04-11 033530](https://github.com/user-attachments/assets/cfde7c55-811a-4ab8-acee-afbd4ab6703a)

────────────────────────────────────────────────────────────────────────────

🌐 2. NETWORK CONNECTION INITIATED RIGHT AFTER HTA RUN

🕒 Time: 6/15/2019 7:13:44 AM  
📡 Connection Info:
- Source IP: 10.0.2.13 (IEWIN7)
- Destination IP: 10.0.2.18
- Source Port: 49159
- Destination Port: 4443
- Protocol: TCP
- Initiated: True

⚠️ Flags:
- Connection happens **2 seconds after HTA runs** → likely **callback to attacker**
- Destination port 4443 → **non-standard HTTPS**, often used for **custom C2**
- Destination host may be another **compromised internal box**

────────────────────────────────────────────────────────────────────────────

🧬 3. DLLHOST.EXE SPAWNED WITH CLSID SHORTLY AFTER

🕒 Time: 6/15/2019 7:14:32 AM  
➤ CommandLine:  
C:\Windows\system32\DllHost.exe /Processid:{AB8902B4-09CA-4BB6-B78D-A8F59079A8D5}

⚠️ Flags:
- `DllHost.exe` with `/Processid:{CLSID}` = **COM object loading**
- Classic method used for:
  - **LOLBIN execution**
  - **Defense evasion** (signed Microsoft binary)
  - **COM hijacking** (malicious DLL registered under CLSID)
- If that CLSID doesn't map to legit COM object = **malware likely loading DLL from unknown path**
- If host is not doing COM-related legit work (Office, MMC), this behavior is **totally sus**

────────────────────────────────────────────────────────────────────────────

⚔️ REAL-WORLD KILLCHAIN SUMMARY:

1️⃣ Attacker plants HTA payload (`update.hta`) in temp folder  
2️⃣ mshta.exe executes it → stealth, script-based payload  
3️⃣ HTA beacons out to 10.0.2.18:4443 → internal pivot/C2  
4️⃣ dllhost.exe runs COM object using suspicious CLSID → likely persistence / second stage

────────────────────────────────────────────────────────────────────────────

🧠 NEXT MOVE FOR INVESTIGATION:

✅ Extract & analyze `update.hta` payload (sandbox or static)  
✅ Check CLSID on endpoint:
   `reg query HKCR\CLSID\{AB8902B4-09CA-4BB6-B78D-A8F59079A8D5} /s`  
✅ Check if 10.0.2.18 is active C2 or compromised internal pivot  
✅ Hunt for same mshta/dllhost pattern across other systems

────────────────────────────────────────────────────────────────────────────

💡 TL;DR: Highly suspicious mshta → HTA execution chain, followed by network comms + COM object via dllhost. Classic LOLBIN abuse for initial access, callback, and potential persistence.  

