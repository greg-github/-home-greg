import XMonad hiding (Tall)
 
import XMonad.Actions.Promote
import XMonad.Actions.UpdatePointer
import XMonad.Actions.Warp
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Layout.Accordion
import XMonad.Layout.Combo
import XMonad.Layout.Grid
import XMonad.Layout.LayoutHints
import XMonad.Layout.HintedTile
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
--import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Tabbed
import XMonad.Layout.TwoPane
import XMonad.Layout.WindowNavigation
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.Ssh
import XMonad.Prompt.RunOrRaise
import XMonad.Util.Run (spawnPipe)
import qualified XMonad.StackSet as W 
import qualified Data.Map as M
import XMonad.Layout.IM
import Data.Ratio
import System.IO
import GHC.IOBase (Handle)
main :: IO ()
main = do
    dzenLeft <- spawnPipe myStatusBar
    spawn myRightBar  
    spawn "sleep 2 && stalonetray &"
    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
        { normalBorderColor  = focusColor
        , focusedBorderColor = lightTextColor
        , terminal = "urxvt"
        , layoutHook = myLayout
        , manageHook =  myManageHook
        , modMask = mod4Mask
        , borderWidth = 2
	--, workspaces = map show [1 .. 9]
	, workspaces = ["~","1","2","3","4","5","6","7","8","9","0","-","=","a","b","c","d","e","f","g","h","i","j","k","l"]
        , keys = \c -> myKeys c `M.union` keys defaultConfig c
        , logHook = myPP dzenLeft
        }
        where
            myLayout = layoutHints $ avoidStruts $ noBorders $ hintedTile Tall
                                 ||| hintedTile Wide
                                 ||| Full
                                 ||| tabbed shrinkText myTheme
                                 ||| spiral (1 % 1)
--            combo1 = windowNavigation ( combineTwo (TwoPane delta ratio) (tabbed shrinkText myTheme) (hintedTile Tall) )
--	    combo2 = windowNavigation ( combineTwo (Grid) (tabbed shrinkText myTheme) (tabbed shrinkText myTheme) ) 
--	    combo3 = windowNavigation ( combineTwo (Grid) (combo2) (combo2) )
            hintedTile = HintedTile nmaster delta ratio TopLeft
            nmaster = 1
            ratio   = 1/2
            delta   = 3/100

            myPP :: Handle -> X ()
            myPP din = (dynamicLogWithPP $ defaultPP
                { ppCurrent = dzenColor lightTextColor "" . 
		(\x -> case x of
					"~"->"~"
					"1"->"1"
					"2"->"2"
					"3"->"3"
					"4"->"4"
					"5"->"5"
					"6"->"6"
					"7"->"7"
					"8"->"8"
					"9"->"9"
					"0"->"0"
					"-"->"-"
					"="->"="
					_ -> ""
		)
                , ppVisible = dzenColor focusColor "" . 
		(\x -> case x of
				"~"->"~"
				"1"->"1"
				"2"->"2"
				"3"->"3"
				"4"->"4"
				"5"->"5"
				"6"->"6"
				"7"->"7"
				"8"->"8"
				"9"->"9"
				"0"->"0"
				"-"->"-"
				"="->"="
				_ -> ""
		)
                , ppHiddenNoWindows = dzenColor "#000000" "" . 
		(\x -> case x of
                                "~"->"~"
                                "1"->"1"
                                "2"->"2"
                                "3"->"3"
                                "4"->"4"
                                "5"->"5"
                                "6"->"6"
                                "7"->"7"
                                "8"->"8"
                                "9"->"9"
                                "0"->"0"
                                "-"->"-"
                                "="->"="
                                _ -> ""
		)
		, ppHidden = dzenColor "#ffffff" "" .
                (\x -> case x of
                                "~"->"~"
                                "1"->"1"
                                "2"->"2"
                                "3"->"3"
                                "4"->"4"
                                "5"->"5"
                                "6"->"6"
                                "7"->"7"
                                "8"->"8"
                                "9"->"9"
                                "0"->"0"
                                "-"->"-"
                                "="->"="
                                _ -> ""
                )
                , ppUrgent = dzenColor "red" "black"
                , ppSep = " · "
                , ppWsSep = ""
                , ppTitle = dzenColor lightTextColor ""
                , ppOutput = hPutStrLn din
		, ppLayout = dzenColor "#ffffff" "" .
		(\x -> case x of
                                      "Hinted Tall" -> "^i(" ++ myBMDir ++ "tall.xbm)"
                                      "Hinted Wide" -> "^i(" ++	myBMDir	++ "wide.xbm)"
                                      "Hinted Full" -> "^i(" ++	myBMDir	++ "all.xbm)"
                                      "Hinted Tabbed Simplest" -> "^i(" ++ myBMDir ++ "tab.xbm)"
                                      "Hinted Spiral" -> "^i(" ++ myBMDir  ++ "spiral.xbm)"
				      "Hinted combining Tabbed Simplest and Tall with TwoPane" -> "+||"
				      "Hinted combining combining Tabbed Simplest and Tabbed Simplest with Grid and combining Tabbed Simplest and Tabbed Simplest with Grid with Grid" -> "+++"
				      "Hinted Accordion" -> "///"
               	                      _ -> ""
               )

                })

            myTheme :: Theme
            myTheme = defaultTheme
                { activeColor = lightBackgroundColor
                , inactiveColor = backgroundColor
                , urgentColor = backgroundColor
                , activeBorderColor = textColor
                , inactiveTextColor = textColor
                , urgentTextColor = textColor
                , inactiveBorderColor = lightBackgroundColor
                , urgentBorderColor = urgentColor
                , activeTextColor = lightTextColor
                , fontName = myFont
                }
 
            myXPConfig :: XPConfig
            myXPConfig = defaultXPConfig
                { font        = myFont
                , bgColor     = backgroundColor
                , fgColor     = textColor
                , fgHLight    = lightTextColor
                , bgHLight    = lightBackgroundColor
                , borderColor = lightBackgroundColor
                }
 
--            myFont = "xft:DejaVu Sans:size=10"
            focusColor = "#23FF95"
            textColor = "#23FF95"
            lightTextColor = "#00A0FF"
            backgroundColor = "#00A0FF"
            lightBackgroundColor = "#A6FF2A"
            urgentColor = "#ff0000"
	    myStatusBar = "dzen2 -x '0' -y '0' -h '24' -w '1440' -ta 'l' -fg '#FFFFFF' -bg '#161616' -fn 'xft:Terminus:bold:pixelsize=11:antialias=false'" 
	    myFont = "-*-terminus-medium-*-*-*-12-120-75-75-*-*-iso8859-*"
	    myRightBar = "conky -c /home/greg/.xmonad/conkyrc | dzen2 -x '0' -y '0' -h '24' -w '1440' -xs '2' -ta 'r' -fg '#FFFFFF' -bg '#161616' -fn 'xft:Terminus:bold:pixelsize=11:antialias=false'"
	    myBMDir = "/home/greg/.xmonad/xbm8x8/"
 	    myManageHook :: ManageHook
	    myManageHook = (composeAll . concat $
    	    		 [ [className     =? "stalonetray"            --> doIgnore] -- ignore desktop
        		 ]) 

            myKeys conf@(XConfig {XMonad.modMask = modMask, workspaces = ws}) = M.fromList $
                [ ((modMask,                 xK_Return), promote)
                , ((modMask,                 xK_b), sendMessage ToggleStruts)
                , ((modMask,                 xK_z), warpToWindow 1 1)
                , ((modMask,                 xK_q), recompile True >> restart "xmonad" True)
		, ((modMask, 		     xK_x), runOrRaisePrompt defaultXPConfig)
                , ((modMask, 		     xK_z), shellPrompt defaultXPConfig)
		, ((modMask, 		     xK_Right), sendMessage $ Move R)
    		, ((modMask, 	 	     xK_Left ), sendMessage $ Move L)
    		, ((modMask, 	 	     xK_Up   ), sendMessage $ Move U)
    		, ((modMask, 	 	     xK_Down ), sendMessage $ Move D)
		, ((modMask, 		     xK_d ), spawn "ncmpcpp -h 127.0.0.1 prev")
		, ((modMask,		     xK_f ), spawn "ncmpcpp -h 127.0.0.1 next")
    		, ((modMask,  	     	     xK_a ), spawn "ncmpcpp -h 127.0.0.1 play")
    		, ((modMask, 		     xK_s ), spawn "ncmpcpp -h 127.0.0.1 pause")
		, ((modMask,		     xK_l ), spawn "slock")

		]
		++
    		[((m .|. modMask, k), windows $ f i)
        	| (i, k) <- zip (XMonad.workspaces conf) [xK_grave, xK_1, xK_2, xK_3, xK_4, xK_5, xK_6, xK_7, xK_8, xK_9, xK_0, xK_minus, xK_equal, xK_F1, xK_F2, xK_F3, xK_F4, xK_F5, xK_F6, xK_F7, xK_F8, xK_F9, xK_F10, xK_F11, xK_F12]
        	, (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
