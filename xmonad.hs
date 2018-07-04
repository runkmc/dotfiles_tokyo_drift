import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.Spacing
import XMonad.Layout
import XMonad.Layout.MultiColumns

myLayoutHook = spacing 20 (Tall 1 (3/100) (1/2)) 
               ||| Full
               ||| spacing 20 (multiCol [1,2,3] 0 0.01 0.4)
               ||| spacing 20 (multiCol [1,2,3] 0 0.01 0.6)

myTerminal = "urxvt"

main = do 
xmonad =<< xmobar def
		{ modMask = mod4Mask
		, terminal = myTerminal
		, layoutHook = myLayoutHook
		, borderWidth = 10
		, normalBorderColor = "#5E81AC"
		, focusedBorderColor = "#D08770"
		}

