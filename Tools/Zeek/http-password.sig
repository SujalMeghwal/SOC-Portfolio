signature http-password {
  ip-proto == tcp
  payload /password/i
  event "Cleartext Password Found!"
}
