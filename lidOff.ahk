WM_POWERBROADCAST(wparam, lparam)
{
  if (wparam = 0x8013) ;PBT_POWERSETTINGCHANGE
  {
    new_state := Numget(lparam+20, 0, "uchar")
    ;new_state = 0 = closed
    ;new_state = 1 = opened
    if(new_state = 0) {
        ; FormatTime, TimeString,, HH:mm:ss
        ; global aaa := "The lid was " (new_state ? "opened" : "closed" ) " at " TimeString "`n"
        ; ToolTip % aaa
        DllCall("LockWorkStation")
    }
  }
  return 1
}