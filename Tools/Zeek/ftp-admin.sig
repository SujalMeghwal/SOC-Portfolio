signature ftp-admin {
  ip-proto == tcp
  ftp /USER\s+admin/i
  event "FTP Admin Login Attempt!"
}
