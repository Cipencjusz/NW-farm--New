; Nuclear Winter afk script ver 1.02 by Cipencjusz

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetDefaultMouseSpeed, 30
#SingleInstance force
CoordMode, Mouse, Client
CoordMode, Pixel, Client
global CanSeeHP, MenuStart, SelectGameMode, IsFalloutOpened, OpenFallout, InfoTabAfterLogin, CountToReset, SeeNWJoinWorld, NWMapLoaded, GameFinishedNW, SeeHpAndAp, Step, IsMapOpened, seeFillTeam, LogScreeenLoaded


; LEFT ALT + P - START SCRIPT  - Start corretly only when You are loged in and in main menu, if You have AutoLogin setuped it will also start without F76 opened.
; LEFT ALT + Z - EXIT SCRIPT



; ----- CHANGE VALUES HERE ----------------------------------------------------------------------------------------------------------

; game folder path - usally should look like C:\Program Files (x86)\Bethesda.net Launcher\games\Fallout76
global dir1 := "C:\Program Files (x86)\Bethesda.net Launcher\games\Fallout76"

; value = 0 --> do not autologin - exit script if some error occures
; value = 1 --> restart game and login back - reccomended - it handle some random errors like server disc or simple game crash - it will restart client and start farming again
global AutoLogin := 0

; account login - if You don't wanna put it here , please change AutoLogin value for 0
global login := "xxx"

; account password - if You don't wanna put it here , please change AutoLogin value for 0
global pass := "xxx"

; value = 0 --> random position on map
; value = 1 --> selected position in map - check function ChooseStartPosition() for custom where to start
global ChooseStartingPosition := 1

; value = 0 --> fill team off
; value = 1 --> fill team on - recomended if You don't want to show Your position to other players.
global fillTeam := 1

;--------------------------------------------------------------------------------------------------------------------------------------





; Functions ---------------------------------------------------------------------------------------------------------------------------


;---------------------------------------------------------------------------
ChooseStartPosition() { 
;---------------------------------------------------------------------------
	if (ChooseStartingPosition = 1)
	{
		MouseMove, 418, 318	; ------CHANGE STARTING MAP CORDINATES HERE - You can take cordinates from this picture https://imgur.com/7MWMlHN ----
		sleep, 1000
		SendMouse_LeftClick()
		sleep, 1000
		SendMouse_LeftClick()
	}
}

; in game behavior - check funtion BehaviorExamples for list of avaliable actions
;---------------------------------------------------------------------------
StartGameBehavior() { 
;---------------------------------------------------------------------------
   ;crouch
	Send {LCtrl down}
	sleep, 150
	Send {LCtrl up}
	sleep, 150
	
	
	; mouse move right
	mouseXY(50,0)
	;walk 5 sec
	
	Send {x down}
	sleep, 150
	Send {x up}
	sleep, 5850
	Send {x down}
	sleep, 150
	Send {x up}
	sleep, 150
}

;---------------------------------------------------------------------------
BehaviorExamples() { 
;---------------------------------------------------------------------------
	;crouch
	Send {LCtrl down}
	sleep, 150
	Send {LCtrl up}
	sleep, 150
	
	;walk x sec
	Send {x down}
	sleep, 150
	Send {x up}
	sleep, 00000  ; change how long it must walk here --> 1 second = 1000 (remember to -150 (frist x press downtime))
	Send {x down}
	sleep, 150
	Send {x up}
	sleep, 150
	
	;turn mouse right (value 2700 is turning around 180°)
	mouseXY(100,0)

	;turn mouse left (value 2700 is turning around 180°)
	mouseXY(-100,0) 
	
	;turn mouse down 
	mouseXY(0,100) 
	
	;turn mouse up
	mouseXY(0,-100) 
	
}

open_F76() {
	IfWinExist Fallout76
	{
		WinActivate
		Sleep, 300
	}
}		

;---------------------------------------------------------------------------
SendDelate() { 
;---------------------------------------------------------------------------
    DllCall("keybd_event", "UInt", 0x2E, "UInt", dwFlags, "UInt", 0x0001) 
	Sleep, 75
	DllCall("keybd_event", "UInt", 0x2E, "UInt", dwFlags, "UInt", 0x0002)
}

;---------------------------------------------------------------------------
SendENTER() { ; send fast left mouse clicks
;---------------------------------------------------------------------------
    DllCall("keybd_event", "UInt", 0x0D, "UInt", dwFlags, "UInt", 0x0001) 
	sleep, 75
	DllCall("keybd_event", "UInt", 0x0D, "UInt", dwFlags, "UInt", 0x0002)
}

;---------------------------------------------------------------------------
SendMouse_LeftClick() { ; send fast left mouse clicks
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x02) ; left button down
	sleep, 50
    DllCall("mouse_event", "UInt", 0x04) ; left button up
}

;---------------------------------------------------------------------------
SendMouse_RightClick() { ; send fast right mouse clicks
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x08) ; right button down
	sleep, 50
    DllCall("mouse_event", "UInt", 0x10) ; right button up
}

;---------------------------------------------------------------------------
SendMouse_MiddleClick() { ; send fast middle mouse clicks
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x20) ; middle button down
    DllCall("mouse_event", "UInt", 0x40) ; middle button up
}

mouseXY(x,y)
{
DllCall("mouse_event",uint,1,int,x,int,y,uint,0,int,0)
}

;---------------------------------------------------------------------------
SendMouse_Wheel(w) { ; send mouse wheel movement, pos=forwards neg=backwards
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x800, "UInt", 0, "UInt", 0, "UInt", w)
}

;---------------------------------------------------------------------------
SendMouse_LeftClickDown() { ; send fast left mouse clicks
;---------------------------------------------------------------------------
    DllCall("mouse_event", "UInt", 0x02) ; left button down
	
}

;---------------------------------------------------------------------------
SendMouse_LeftClickUp() { ; send fast left mouse clicks
;---------------------------------------------------------------------------
   
    DllCall("mouse_event", "UInt", 0x04) ; left button up
}

;---------------------------------------------------------------------------
IsMapOpened() { 
;---------------------------------------------------------------------------

	global IsMapOpened := 0
		
	MOpen1 := 0
	PixelSearch, MOpen1x, MOpen1y, 768, 117, 768, 117, 0xFFFFCB, 60
	If ErrorLevel = 0	
		MOpen1 := 1

	MOpen2 := 0
	PixelSearch, MOpen2x, MOpen2y, 771, 119, 771, 119, 0x191915, 30
	If ErrorLevel = 0	
		MOpen2 := 1

	If (MOpen1 = 1 and MOpen2 = 1)
	{
		global IsMapOpened := 1
	}
}

;---------------------------------------------------------------------------
CanSeeHP() { 
;---------------------------------------------------------------------------
    global CanSeeHP := 0

	WHP1 := 0
	PixelSearch, WHP1x, WHP1y, 31, 491, 31, 491, 0xFFFFCB, 60
	If ErrorLevel = 0	
		WHP1 := 1

	WHP2 := 0
	PixelSearch, WHP2x, WHP2y, 37, 491, 37, 491, 0xFFFFCB, 60
	If ErrorLevel = 0	
		WHP2 := 1

	WHP3 := 0
	PixelSearch, WHP3x, WHP3y, 40, 494, 40, 494, 0xFFFFCB, 60
	If ErrorLevel = 0	
		WHP3 := 1

	If (WHP1 = 1 and WHP2 = 1 and WHP3 = 1)
	{
		global CanSeeHP := 1
		;~ FileAppend, 
		;~ (
		;~ CanSeeHP
			
		;~ ),
	}
}

;---------------------------------------------------------------------------
MenuLong() { 
;---------------------------------------------------------------------------
			global MenuLong := 0
			
			Menu1 := 0
			PixelSearch, Menu1x, Menu1y, 99, 262, 101, 264, 0xFBFACA, 70 
			If ErrorLevel = 0	
				Menu1 := 1
			
			Menu2 := 0
			PixelSearch, Menu2x, Menu2y, 141, 289, 143, 291, 0xFAFAC6, 70 
			If ErrorLevel = 0	
				Menu2 := 1
			
			Menu3 := 0
			PixelSearch, Menu2x, Menu2y, 10, 580, 10, 580, 0x000000, 5 
			If ErrorLevel = 0	
				Menu3 := 1

			If (Menu1 = 1 and Menu2 = 1 and Menu3 = 1)
			{	
				global MenuLong := 1
				FileAppend, 
				(
				menu long zaladowane
					
				), Logs\Logs.txt
			}
}

;---------------------------------------------------------------------------
MenuStart() { 
;---------------------------------------------------------------------------
   
	
	global MenuStart := 0

	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 108, 244, 108, 244, 0xFDFDC7, 60
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 175, 243, 175, 243, 0xFDFDC7, 60 
	If ErrorLevel = 0	
		XXX2 := 1

	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 99, 299, 99, 299, 0xFDFDC7, 60 
	If ErrorLevel = 0	
		XXX3 := 1

	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		global MenuStart := 1
		FileAppend, 
		(
		Menu Start Loaded
			
		), Logs\Logs.txt
	}

}

;---------------------------------------------------------------------------
IsFalloutOpened() { 
;---------------------------------------------------------------------------
	global IsFalloutOpened := 0
	IfWinExist , Fallout76
	{
		global IsFalloutOpened := 1
	}
}

;---------------------------------------------------------------------------
LogScreeenLoaded() { 
;---------------------------------------------------------------------------
    global LogScreeenLoaded := 0
				
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 409, 259, 409, 259, 0xECECBC, 60
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 411, 259, 411, 259, 0xEDEDBD, 60 
	If ErrorLevel = 0	
		XXX2 := 1

	If (XXX1 = 1 and XXX2 = 1)
	{
		global LogScreeenLoaded := 1
	}
}

;---------------------------------------------------------------------------
OpenFallout() { 
;---------------------------------------------------------------------------
    global OpenFallout := 0
	
	Loop
	{
		Run, F76PrefsReplacmentNW.ahk
		sleep, 5000
		run, Fallout76.exe, %dir1%
		sleep, 15000
		CoordMode, Mouse, Screen
		sleep, 500
		MouseClick, left, 30, 11
		sleep, 1000
		CoordMode, Mouse, Client
		sleep, 500
		
		loginLoop := 0
		Loop
		{
			send {space down}
			sleep, 150
			send {space up}
			sleep, 10000
			
			LogScreeenLoaded()
			
			loginLoop := loginLoop + 1
		}
		until (LogScreeenLoaded = 1 or loginLoop = 3)
			
		sleep, 6900
		IfWinExist , Fallout76
		{
			global OpenFallout := 1
		}
	}
	until (OpenFallout = 1)
}

;---------------------------------------------------------------------------
Login() { 
;---------------------------------------------------------------------------
	if (AutoLogin = 1)
	{
		p := 0
		Loop
		{
			; click on login and select all
			MouseMove, 383, 326
			Sleep, 250
			SendMouse_LeftClick()
			Sleep, 250
			SendMouse_LeftClick()
			Sleep, 150
			
			MouseMove, 472, 319
			sleep, 150
			SendMouse_LeftClickDown()
			sleep, 150
			MouseMove, 310, 319
			sleep, 150
			SendMouse_LeftClickUp()
			sleep, 350
			SendDelate()
			Sleep, 350
			
			; login
			LogScreeenLoaded()
			if (LogScreeenLoaded = 1)
			{
				SendInput, %Login%
				sleep, 300
			}
			
			 ; click on login and select all
			MouseMove, 393, 360
			Sleep, 250
			SendMouse_LeftClick()
			Sleep, 250
			SendMouse_LeftClick()
			Sleep, 350
			MouseMove, 472, 359
			sleep, 150
			SendMouse_LeftClickDown()
			sleep, 150
			MouseMove, 310, 359
			sleep, 150
			SendMouse_LeftClickUp()
			sleep, 350
			SendDelate()
			Sleep, 350
			
			; password
			LogScreeenLoaded()
			if (LogScreeenLoaded = 1)
			{
				SendInput, %pass%
				sleep, 300
			}
			
			; confirm and check if menu loaded
			LogScreeenLoaded()
			if (LogScreeenLoaded = 1)
			{
				sendEnter()
				sleep, 200
				sendEnter()
				sleep, 200
				sendEnter()
				sleep, 200
			}
			sleep, 6000
			LogScreeenLoaded()
			if (LogScreeenLoaded = 0)
			{	
				k := 0
				Loop
				{
					MouseMove, 134, 217
					sleep, 100
					MouseMove, 138, 217
					sleep, 100
					InfoTabAfterLogin()
					sleep, 1000
					k := k + 1
				}
				until (InfoTabAfterLogin or k = 120)
			}
			
			p := p + 1
		}
		Until (InfoTabAfterLogin = 1 or p = 5)
		
		p := 0
		Loop
		{
			send {tab down}
			sleep, 150
			send {tab up}
			sleep, 3000
			MenuStart()
			p := p + 1
		}
		until (MenuStart = 1 or p = 20)
	}
	
	if (AutoLogin = 0)
	{
		ExitApp
	}
}


;---------------------------------------------------------------------------
InfoTabAfterLogin() { 
;---------------------------------------------------------------------------
    global InfoTabAfterLogin := 0

	; long description / viev atomic / continue
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 300, 504, 300, 504, 0xE9E9BA, 90
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 332, 503, 332, 503, 0xFFFFCB, 90 
	If ErrorLevel = 0	
		XXX2 := 1
	
	; SHORT description / continue
	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 428, 506, 428, 506, 0xFDFDCA, 90
	If ErrorLevel = 0	
		XXX3 := 1
	
	XXX4 := 0
	PixelSearch, XXX4x, XXX4y, 401, 505, 401, 505, 0xFDFDCA, 90
	If ErrorLevel = 0	
		XXX4 := 1

	If ((XXX1 = 1 and XXX2 = 1) or (XXX3 = 1 and XXX4 = 1))
	{
		global InfoTabAfterLogin := 1
	}


}


;---------------------------------------------------------------------------
StartGameNW() { 
;---------------------------------------------------------------------------

	
	MenuClicked := 0
	GameModeClicked := 0
	
	p := 0
	Loop
	{
		; move mouse to play position 
		MouseMove, 134, 217
		sleep, 100
		MouseMove, 138, 217
		sleep, 100
		MenuStart()
		
		; wait if not loaded
		if (MenuStart = 0)
		{
			sleep, 1000
		}
		
		; click if loaded
		if (MenuStart = 1)
		{
			SendMouse_LeftClick()
			sleep, 690
			
			; check if clicked
			MenuStart()
			if (MenuStart = 0)
			{
				MenuClicked := 1
				FileAppend, 
				(
				Menu Start Clicked
					
				), Logs\Logs.txt
			}
		}
		p := p + 1
	}
	until (MenuClicked = 1 or p = 60)
	
	p := 0
	Loop
	{
		SelectGameMode(3)
		
		; wait if not loaded
		if (SelectGameMode = 0)
		{
			sleep, 500
		}
		
		
		
		; click if loaded
		if (SelectGameMode = 1)
		{
			; setup fill team
			fillTeamSetup()
			sleep, 690
			
			SendMouse_LeftClick()
			sleep, 690
			
			
			
			; check if clicked
			SelectGameMode(3)
			if (SelectGameMode = 0)
			{
				GameModeClicked := 1
				FileAppend, 
				(
				Game Mode Select Clicked
					
				), Logs\Logs.txt
			}
		}
		p := p + 1
	}
	until (GameModeClicked = 1 or p = 60)
	
	
	
	;jOIN WORLD
	p := 0
	JoinWorldConfirmed := 0
	Loop
	{
		SeeNWJoinWorld()
		
		; wait if not loaded
		if (SeeNWJoinWorld = 0)
		{
			sleep, 500
		}
		
	
		
		; click if loaded
		if (SeeNWJoinWorld = 1)
		{
			Send {Space down}
			sleep, 150
			Send {Space up}
		
			sleep, 1000
			
			; check if clicked
			SeeNWJoinWorld()
			if (SeeNWJoinWorld = 0)
			{
				JoinWorldConfirmed := 1
				FileAppend, 
				(
				Game Mode Select Clicked
					
				), Logs\Logs.txt
			}
		}
		p := p + 1
	}
	until (JoinWorldConfirmed = 1 or p = 60)
	
}

;---------------------------------------------------------------------------
SeeNWJoinWorld() { 
;---------------------------------------------------------------------------
    global SeeNWJoinWorld := 0

	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 232, 157, 232, 157, 0x080A0A, 10
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 480, 146, 480, 146, 0x080A0A, 10
	If ErrorLevel = 0	
		XXX2 := 1

	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 415, 418, 415, 418, 0x090805, 10
	If ErrorLevel = 0	
		XXX3 := 1

	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		global SeeNWJoinWorld := 1
	}
}


;---------------------------------------------------------------------------
LeaveGameNW() { 
;---------------------------------------------------------------------------
    p := 0
	Loop
	{
		Send, {Esc Down}
		Sleep, 150
		Send, {Esc Up}
		sleep, 1500
		IsMapOpened()
		CanSeeHP()
		p := p + 1
	}
	until (IsMapOpened = 1 or CanSeeHP = 1 or p = 22)
	
	CanSeeHP()
	if (CanSeeHP = 0)
	{	
		p := 0
		Loop
		{
			; open menu
			SendInput, {z Down} 
			Sleep, 50
			SendInput, {z Up}
			SLEEP, 300
			MouseMove, 190, 217
			Sleep, 500
			;check for menu loaded
			MenuAfterDeath := 0
		
			MLoad1 := 0
			PixelSearch, MLoad1x, MLoad1y, 96, 209, 96, 209, 0x020201, 30
			If ErrorLevel = 0	
				MLoad1 := 1

			MLoad2 := 0
			PixelSearch, MLoad2x, MLoad2y, 162, 209, 162, 209, 0x010100, 30 
			If ErrorLevel = 0	
				MLoad2 := 1

			If (MLoad1 = 1 and MLoad2 = 1)
			{
				MenuAfterDeath := 1
				
			}
			p := p + 1
			
			
		}
		until (MenuAfterDeath = 1 or p = 10)
		
		p := 0
		Loop
		{
			if ( MenuAfterDeath = 1 )
			{
				MouseMove, 114, 357
				Sleep, 100
				SendMouse_LeftClick()
				Sleep, 300
			}
			
			; quit to main menu	
			MouseMove, 125, 214
			QuitToMainMenuLoaded := 0
		
			QuitToMenu1 := 0
			PixelSearch, QuitToMenu1x, QuitToMenu1y, 88, 242, 88, 242, 0xEDEDBB, 60
			If ErrorLevel = 0	
				QuitToMenu1 := 1

			QuitToMenu2 := 0
			PixelSearch, QuitToMenu2x, QuitToMenu2y, 175, 233, 175, 233, 0xFAFAC5, 60
			If ErrorLevel = 0	
				QuitToMenu2 := 1

			If (QuitToMenu1 = 1 and QuitToMenu2 = 1)
			{
				QuitToMainMenuLoaded := 1
			}
			p := p + 1		
		}
		until (QuitToMainMenuLoaded = 1 or p = 10)
		
		; Confirm leave
		MouseMove, 104, 215
		Sleep, 100
		p := 0
		Loop
			{
				SendMouse_LeftClick()
				i := 0
				Loop
				{
					QuitToMainMenuLoaded := 0
		
					QuitToMenu1 := 0
					PixelSearch, QuitToMenu1x, QuitToMenu1y, 88, 242, 88, 242, 0xEDEDBB, 60
					If ErrorLevel = 0	
						QuitToMenu1 := 1

					QuitToMenu2 := 0
					PixelSearch, QuitToMenu2x, QuitToMenu2y, 175, 233, 175, 233, 0xFAFAC5, 60
					If ErrorLevel = 0	
						QuitToMenu2 := 1

					If (QuitToMenu1 = 1 and QuitToMenu2 = 1)
						QuitToMainMenuLoaded := 1
					i := i + 1
					Sleep, 100
				}
				Until (QuitToMainMenuLoaded = 0 or i = 10)
				p := p + 1
			}
			Until (QuitToMainMenuLoaded = 0 or p = 10)
		
		; check for leave party window (no need here propably)
		
		LeavePartyWindow1 := 0
		PixelSearch, LeavePartyWindow1x, LeavePartyWindow1y, 263, 338, 263, 338, 0xE7E7B8, 60
		If ErrorLevel = 0	
			LeavePartyWindow1 := 1

		LeavePartyWindow2 := 0
		PixelSearch, LeavePartyWindow2x, LeavePartyWindow2y, 269, 344, 269, 344, 0xD2D2A8, 60
		If ErrorLevel = 0	
			LeavePartyWindow2 := 1

		If (LeavePartyWindow1 = 1 and LeavePartyWindow2 = 1)
		{
			MouseMove, 266, 318
			Sleep, 100
			p := 0
			Loop
				{
					SendMouse_LeftClick()
					i := 0
					Loop
					{
						LPM := 0
						LeavePartyWindow1 := 0
						PixelSearch, LeavePartyWindow1x, LeavePartyWindow1y, 263, 338, 263, 338, 0xE7E7B8, 60
						If ErrorLevel = 0	
							LeavePartyWindow1 := 1

						LeavePartyWindow2 := 0
						PixelSearch, LeavePartyWindow2x, LeavePartyWindow2y, 269, 344, 269, 344, 0xD2D2A8, 60
						If ErrorLevel = 0	
							LeavePartyWindow2 := 1
						
						If (LeavePartyWindow1 = 1 and LeavePartyWindow2 = 1)
									LPM := 1
						i := i + 1
						Sleep, 100
					}
					Until (LPM = 0 or i = 10)
					p := p + 1
				}
				Until (LPM = 0 or p = 2)
		}
		else
		{
			Sleep, 3000
		}
		
		;ssss
	}
	
}

;---------------------------------------------------------------------------
SelectGameMode(x) { 
;---------------------------------------------------------------------------
    
	global SelectGameMode := 0

	;advanture mode
	if (x = 1)
	{
		
		; move mouse to adventure position 
		MouseMove, 214, 224
		sleep, 100
		MouseMove, 204, 224
		sleep, 100
		
		XXX1 := 0
		PixelSearch, XXX1x, XXX1y, 118, 147, 118, 147, 0x181C1D, 5
		If ErrorLevel = 0	
			XXX1 := 1

		XXX2 := 0
		PixelSearch, XXX2x, XXX2y, 136, 409, 136, 409, 0xFFFFCB, 60 
		If ErrorLevel = 0	
			XXX2 := 1

		XXX3 := 0
		PixelSearch, XXX3x, XXX3y, 140, 412, 140, 412, 0xFFFFCB, 60 
		If ErrorLevel = 0	
			XXX3 := 1

		If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
		{
			global SelectGameMode := 1
			FileAppend, 
			(
			Select Adventure Game Mode Loaded
				
			), Logs\Logs.txt
		}
	}
	
	;NW
	if (x = 3)
	{
		; move mouse to NW position 
		MouseMove, 570, 170
		sleep, 100
		MouseMove, 580, 170
		sleep, 100
		
		XXX1 := 0
		PixelSearch, XXX1x, XXX1y, 512, 379, 512, 379, 0x181C1D, 5
		If ErrorLevel = 0	
			XXX1 := 1

		XXX2 := 0
		PixelSearch, XXX2x, XXX2y, 535, 407, 535, 407, 0xFDFDC9, 60
		If ErrorLevel = 0	
			XXX2 := 1

		XXX3 := 0
		PixelSearch, XXX3x, XXX3y, 639, 416, 639, 416, 0xF6F6C4, 60 
		If ErrorLevel = 0	
			XXX3 := 1

		If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
		{
			global SelectGameMode := 1
			FileAppend, 
			(
			Select Nuclear Winter Game Mode Loaded
				
			), Logs\Logs.txt
		}
	}
}

;---------------------------------------------------------------------------
NWMapLoaded() { 
;---------------------------------------------------------------------------
    global NWMapLoaded := 0

	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 40, 94, 40, 94, 0xFFFFCB, 70
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 40, 100, 40, 100, 0xFFFFCB, 70
	If ErrorLevel = 0	
		XXX2 := 1

	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 46, 96, 46, 96, 0xFFFFCB, 70
	If ErrorLevel = 0	
		XXX3 := 1

	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		global NWMapLoaded := 1
	}
}



;---------------------------------------------------------------------------
GameFinishedNW() { 
;---------------------------------------------------------------------------
    global GameFinishedNW := 0

	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 573, 375, 573, 375, 0xFDFEC9, 70
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 589, 376, 589, 376, 0xFDFEC9, 70
	If ErrorLevel = 0	
		XXX2 := 1

	XXX3 := 0
	PixelSearch, XXX3x, XXX3y, 611, 376, 611, 376, 0xFDFEC9, 70 
	If ErrorLevel = 0	
		XXX3 := 1

	If (XXX1 = 1 and XXX2 = 1 and XXX3 = 1)
	{
		global GameFinishedNW := 1
	}
}

;---------------------------------------------------------------------------
SeeHpAndAp() { 
;---------------------------------------------------------------------------
	
	global SeeHpAndAp := 0
	; Hp
	WHP1 := 0
	PixelSearch, WHP1x, WHP1y, 31, 491, 31, 491, 0xFFFFCB, 60
	If ErrorLevel = 0	
		WHP1 := 1

	WHP2 := 0
	PixelSearch, WHP2x, WHP2y, 37, 491, 37, 491, 0xFFFFCB, 60
	If ErrorLevel = 0	
		WHP2 := 1

	WHP3 := 0
	PixelSearch, WHP3x, WHP3y, 40, 494, 40, 494, 0xFFFFCB, 60
	If ErrorLevel = 0	
		WHP3 := 1
	
	;Ap
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 624, 494, 624, 494, 0xFFFFCB, 60
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 637, 493, 637, 493, 0xFFFFCB, 60
	If ErrorLevel = 0	
		XXX2 := 1


	If (WHP1 = 1 and WHP2 = 1 and WHP3 = 1 and XXX1 = 1 and XXX2 = 1)
	{
		global SeeHpAndAp := 1
	}
}

;---------------------------------------------------------------------------
seeFillTeam() { 
;---------------------------------------------------------------------------
    global seeFillTeam := 0

	; off
	XXX1 := 0
	PixelSearch, XXX1x, XXX1y, 308, 587, 308, 587, 0xFFFFCB, 60
	If ErrorLevel = 0	
		XXX1 := 1

	XXX2 := 0
	PixelSearch, XXX2x, XXX2y, 308, 593, 308, 593, 0xFFFFCB, 60
	If ErrorLevel = 0	
		XXX2 := 1

	

	If (XXX1 = 1 and XXX2 = 1)
	{
		global seeFillTeam := 1
	}
}

;---------------------------------------------------------------------------
fillTeamSetup() { 
;---------------------------------------------------------------------------
   
	p1 := 0
	if (fillTeam = 0)
	{
		Loop
		{
		seeFillTeam()
		if (seeFillTeam = 1)
		{
			Send, {r Down} 
			Sleep, 150
			Send, {r Up}
			SLEEP, 150
		}
		
		p1 := p1 + 1
		}
		until (seeFillteam = 0 or p1 = 10)
	}
	
	p1 := 0
	if (fillTeam = 1)
	{
		Loop
		{
		seeFillTeam()
		if (seeFillTeam = 0)
		{
			Send, {r Down} 
			Sleep, 150
			Send, {r Up}
			SLEEP, 150
		}
		
		p1 := p1 + 1
		}
		until (seeFillteam = 1 or p1 = 10)
	}

	
	
}

;PPPPPP
;---------------------------------------------------------------------------
ScriptBehavior() { 
;---------------------------------------------------------------------------
	open_F76()
	
	Step := 0
	Loop
	{
		
		MouseMove, 144, 217
		sleep, 300
		
		if (Step = 0) 
		{
			; menu long
			XXX1 := 0
			PixelSearch, XXX1x, XXX1y, 108, 244, 108, 244, 0xFDFDC7, 60
			If ErrorLevel = 0	
				XXX1 := 1

			XXX2 := 0
			PixelSearch, XXX2x, XXX2y, 175, 243, 175, 243, 0xFDFDC7, 60 
			If ErrorLevel = 0	
				XXX2 := 1

			XXX3 := 0
			PixelSearch, XXX3x, XXX3y, 99, 299, 99, 299, 0xFDFDC7, 60 
			If ErrorLevel = 0	
				XXX3 := 1
			
			; menu short - not corrected
			Menu3 := 0
			PixelSearch, Menu3x, Menu3y, 98, 235, 100, 237, 0xF6F6C3, 70
			If ErrorLevel = 0	
				Menu3 := 1

			Menu4 := 0
			PixelSearch, Menu4x, Menu4y, 155, 267, 157, 269, 0xE0E1B1, 70 
			If ErrorLevel = 0	
				Menu4 := 1
				
			If ((XXX1 = 1 and XXX2 = 1 and XXX3 = 1) or (Menu3 = 1 and Menu4 = 1))
			{	
				global Step := 2
			}		 
			
			IsFalloutOpened()
			if (IsFalloutOpened = 0)
			{
				global Step := 99
			}
		}	
		
		;/\/\/\/\/\/\/\/\/\/\/\/
		; 1 Leave game 
		if (Step = 1)
		{
			IsFalloutOpened()
			if (IsFalloutOpened = 0)
			{
				global Step := 99
			}
			if (IsFalloutOpened = 1)
			{	
				LeaveGameNW()
				sleep, 5000
				p := 0
				Loop
				{
					; move mouse to play position 
					MouseMove, 134, 217
					sleep, 100
					MouseMove, 138, 217
					sleep, 100
					MenuStart()
					
					; wait if not loaded
					if (MenuStart = 0)
					{
						sleep, 1000
						p := p + 1
					}
				}
				until (MenuStart = 1 or p = 20)
				
				if (MenuStart = 1)
				{
					global Step := 2
				}
				
				if (p = 20)
				{
					global Step := 98
				}
			}
		}
		

		;/\/\/\/\/\/\/\/\/\/\/\/
		; 2 game start
		if (Step = 2)
		{
			IsFalloutOpened()
			if (IsFalloutOpened = 0)
			{
				global Step := 99
			}
			if (IsFalloutOpened = 1)
			{	
				
				StartGameNW()
				
				
				global Step := 3
				FileAppend, 
				(
				Step 3 started
					
				), Logs\Logs.txt
			}
		}
		
		; wait for new server
		if (Step = 3)
		{
			p := 0
			Loop
			{
				IsFalloutOpened()
				SeeHpAndAp()
				sleep, 1000
				if (SeeHpAndAp = 1)
				{
					sleep, 5000
					SeeHpAndAp()
				}
				p := p + 1
			}
			until (IsFalloutOpened = 0 or SeeHpAndAp = 1 or p = 3600)
			
			if (IsFalloutOpened = 0)
			{
				global Step := 99
			}
			
			if (SeeHpAndAp = 1)
			{
				global Step := 4
				FileAppend, 
				(
				Step 4 started
					
				), Logs\Logs.txt
			}
			
			if (p = 3600)
			{
				global Step := 98
			}
		}

		; wait for map loaded
		if (Step = 4)
		{
			p := 0
			Loop
			{
				IsFalloutOpened()
				NWMapLoaded()
				SeeHpAndAp()
				sleep, 1000
				p := p + 1
			}
			until (IsFalloutOpened = 0 or (NWMapLoaded = 1 and SeeHpAndAp = 0) or p = 500)
			
			if (IsFalloutOpened = 0)
			{
				global Step := 99
			}
			
			if (NWMapLoaded = 1 and SeeHpAndAp = 0)
			{
				ChooseStartPosition()
				global Step := 5
				FileAppend, 
				(
				Step 5 started
					
				), Logs\Logs.txt
			}
			
			if (p = 500)
			{
				global Step := 98
			}
		}
		
		; wait for game start
		if (Step = 5)
		{
			p := 0
			Loop
			{
				IsFalloutOpened()
				SeeHpAndAp()
				if (SeeHpAndAp = 1)
				{
					sleep, 5000
					SeeHpAndAp()
				}
				sleep, 1000
				p := p + 1
			}
			until (IsFalloutOpened = 0 or SeeHpAndAp = 1 or p = 500)
			
			if (IsFalloutOpened = 0)
			{
				global Step := 99
			}
			
			if (SeeHpAndAp = 1)
			{
				StartGameBehavior()
				global Step := 6
				FileAppend, 
				(
				Step 6 started
					
				), Logs\Logs.txt
			}
			
			if (p = 500)
			{
				global Step := 98
			}
		}
		
		; wait for game end
		if (Step = 6)
		{
			p := 0
			Loop
			{
				IsFalloutOpened()
				GameFinishedNW()
				SeeHpAndAp()
				sleep, 1000
				p := p + 1
				
				;move mouse every 5 minutes (anty afk disc)
				if (p = 300 or p = 600 or p = 900 or p = 1200 or p = 1500 or p = 1800 or p = 2100)
				{
					mouseXY(20,20)
					sleep, 100
				}
			}
			until (IsFalloutOpened = 0 or (GameFinishedNW = 1 and SeeHpAndAp = 0) or p = 2400)
			
			if (IsFalloutOpened = 0)
			{
				global Step := 99
			}
			
			if (GameFinishedNW = 1 and SeeHpAndAp = 0)
			{
				global Step := 1
				FileAppend, 
				(
				Game finished - restarting - step 1 started
					
				), Logs\Logs.txt
			}
			
			if (p = 2400)
			{
				global Step := 98
			}
		}
		
		
		if (Step = 98)
		{
			WinClose, Fallout76
			sleep, 1000
			global Step := 99
		}
		
		if (Step = 99)
		{
			OpenFallout()
			Login()
			global Step := 0
		}
	}
	


}




!p::ScriptBehavior()



!z::ExitApp
