::    =============================================================
::    No warranty is given, use of this script is at your own risk!
::    =============================================================
::
:: ===================================================================
:: Programs this utility will tidy up include ;		Desktop Icons?
::	Audacity,					x
::	Avast Anti Virus,				x
::	BlueStacks		(NEW)			Yes
::	CCleaner		(NEW)			x
::	CPUz			(NEW)			Yes
::	Crystal DiskMark	(NEW)			Yes
::	Firefox,					x
::	Google Chrome,					x
::	Jet Brains Toolbox,				x
::	NVidia Corp,					x
::	OBS,						x
::	Shotcut,					x
::	TeamViewer,					x
::	WinRAR			(NEW)			x
::	World of Tanks,					x
:: ====================================================================

@ECHO OFF
CD\
:: =========================
:: Set your username below..
:: =========================
::
SET %USERNAME% = "YOUR-WINDOWS-ACCOUNT-USERNAME-HERE"

NET SESSION 2>nul
IF %ERRORLEVEL% NEQ 0 GOTO elevate
GOTO elevated

:elevate
:: ===============
:: Elevate for UAC
:: ===============
CD /d %~dp0
MSHTA "javascript: var shell = new ActiveXObject('shell.application'); shell.ShellExecute('%~nx0', '', '', 'runas', 1);close();"
GOTO exit

:elevated
:: =================================================================================
:: Elevation is required for any modification to C:\ProgramData (a hidden) directory
:: =================================================================================
CLS
echo. && echo ************************************** && echo. && echo PREPARING TO CHECK YOUR START MENUs... && echo. && echo ************************************** && echo.

:: ==========
:: Audacity..
:: ==========
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Audacity.lnk" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Audacity\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Audacity.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Audacity\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Audacity.lnk" >nul
		echo ** AUDACITY LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Audacity\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Audacity.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Audacity\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Audacity.lnk" >nul
		echo ** AUDACITY LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no Audacity Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: ==================
:: Avast Anti-Virus..
:: ==================
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Avast*.lnk" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Avast Antivirus\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Avast*.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Avast Antivirus\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Avast*.lnk" >nul
		echo ** AVAST ANTI-VIRUS LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Avast Antivirus\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Avast*.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Avast Antivirus\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Avast*.lnk" >nul
		echo ** AVAST ANTI-VIRUS LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no Avast Anti-Virus Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: ============
:: BlueStacks..
:: ============
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\BlueStacks X\" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\BlueStacks X\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\BlueStacks X\" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\BlueStacks X\" >nul
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\" >nul
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\BlueStacks X\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\BlueStacks X" >nul
	)
) ELSE	(
	IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\BlueStacks Services.lnk" (
		IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\" (
			XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\BlueStacks Services.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\" >nul
			echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\BlueStacks Services.lnk" >nul
		) ELSE (
			md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\"
			XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\BlueStacks Services.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\BlueStacks X\" >nul
			echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\BlueStacks Services.lnk" >nul
			echo ** BLUESTACKS LINKS REMOVED! ** && echo.
		)
	) ELSE	(
		IF EXIST "C:\Users\Public\Desktop\BlueStacks X.lnk" (
			echo y|del "C:\Users\Public\Desktop\BlueStacks X.lnk" >nul
		) ELSE (
			echo Thankfully no BlueStack Links found! && echo.
		)
	)
)
TIMEOUT 1 > nul

:: ==========
:: CCleaner..
:: ==========
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner\" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Cache Cleaner\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner\*.*" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Cache Cleaner\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner\" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner\" >nul
		echo ** CCLEANER LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Cache Cleaner\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Security ESSENTIALS\Cache Cleaner\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner\" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CCleaner\" >nul
		echo ** CCLEANER LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no CCleaner Links found! && echo.
	)
)
IF EXIST "C:\Users\Public\Desktop\CPUID CPU-Z.lnk" (
			echo y|del "C:\Users\Public\Desktop\CPUID CPU-Z.lnk" >nul
		) ELSE (
			BREAK
		)
TIMEOUT 1 > nul

:: ======
:: CPUz..
:: ======
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\CPU-Z\" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows System\CPU-Z" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\CPU-Z\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\CPU-Z\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\CPU-Z" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\CPU-Z\" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\" >nul
		echo ** CPU-Z LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows System\CPU-Z\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\CPU-Z\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\CPU-Z\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\CPU-Z\" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\CPU-Z\" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CPUID\" >nul
		echo ** CPU-Z LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no CPU-Z Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: ==================
:: Crystal DiskMark..
:: ==================
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CrystalDiskInfo\" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\CrystalDiskInfo\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CrystalDiskInfo\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\CrystalDiskInfo\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CrystalDiskInfo\" >nul
		echo ** CRYSTAL DISK INFO LINKS REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\CrystalDiskInfo\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CrystalDiskInfo\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\CrystalDiskInfo\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\CrystalDiskInfo\" >nul
		echo ** CRYSTAL DISK INFO LINKS REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no Crystal Disk Info Links found! && echo.
	)
)
IF EXIST "C:\Users\Public\Desktop\CrystalDiskInfo.lnk" (
			echo y|del "C:\Users\Public\Desktop\CrystalDiskInfo.lnk" >nul
		) ELSE (
			BREAK
		)
TIMEOUT 1 > nul

:: =========
:: Firefox..
:: =========
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefo*.lnk" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefo*.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefo*.lnk" >nul
		echo ** FIREFOX LINKS REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefo*.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefox\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Firefo*.lnk" >nul
		echo ** FIREFOX LINKS REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no Firefox Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: =============
:: Google Chrome
:: =============
IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Google Chrome.lnk" (
	IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Google Chrome\" (
		XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Google Chrome.lnk" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Google Chrome\" >nul
		echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Google Chrome.lnk" >nul
		echo ** GOOGLE CHROME LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Google Chrome\"
		XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Google Chrome.lnk" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Google Chrome\" >nul
		echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Google Chrome.lnk" >nul
		echo ** GOOGLE CHROME LINK REMOVED! ** && echo.
	)
) ELSE (
	echo Thankfully no Google Chrome Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: ====================
:: NVidia Corporation..
:: ====================
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\NVIDIA Corporation\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\*.*" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\NVIDIA Corporation\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\*.*" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\" >nul
		echo ** NVIDIA CORP LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\NVIDIA Corporation\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\*.*" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\NVIDIA Corporation\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\*.*" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\NVIDIA Corporation\" >nul
		echo ** NVIDIA CORP LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no NVIDIA Corp Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: =====
:: OBS..
:: =====
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\OBS Studio\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\*.*" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\OBS Studio\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\*.*" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\" >nul
		echo ** OBS LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\OBS Studio\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\*.*" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\OBS Studio\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\*.*" >nul
		rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio\" >nul
		echo ** OBS LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no OBS Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: ====================
:: Jet Brains Toolbox..
:: ====================
IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\" (
	echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\*.*" >nul
	rd "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\"
	echo ** JETBRAINS TOOLBOX LINK REMOVED! ** && echo.
) ELSE (
	echo Thankfully no Jet Brains Toolbox Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: =========
:: Shotcut..
:: =========
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Shotcut.lnk" (
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Shotcut\" (
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Shotcut.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Shotcut\" /y >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Shotcut.lnk" >nul
		echo ** SHOTCUT LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Shotcut\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Shotcut.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Windows MEDIA\Shotcut\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Shotcut.lnk" >nul
		echo ** SHOTCUT LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no Shotcut Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: =============
:: Team Viewer..
:: =============
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TeamViewer.lnk" ( 
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\TeamViewer\" ( 
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Teamviewer.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\Teamviewer\" /y >nul
		del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TeamViewer.lnk" >nul
		echo ** TEAM VIEWER LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\Teamviewer\"
		XCOPY "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Teamviewer.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\Teamviewer\" >nul
		echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Teamviewer.lnk" >nul
		echo ** TEAM VIEWER LINK REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no Team Viewer Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: ================
:: World of Tanks..
:: ================
IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wargaming.net\" (
	IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Games\Wargaming.net\" (
		XCOPY /e /s /y "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wargaming.net\*.*" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Games\Wargaming.net\" >nul
		echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wargaming.net\*.*" >nul
		rd "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wargaming.net\" >nul
		echo ** WORLD OF TANKS LINK REMOVED! ** && echo.
	) ELSE (
		md "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Games\Wargaming.net\" >nul
		COPY /y "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wargaming.net\*.*" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Games\Wargaming.net\" >nul
		echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wargaming.net\*.*" >nul
		rd "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Wargaming.net\" >nul
		echo ** WORLD OF TANKS LINK REMOVED! ** && echo.
	)
) ELSE (
	echo Thankfully no Wargaming.net Links found! && echo.
	)
)
TIMEOUT 1 > nul

:: ========
:: WinRAR..
:: ========
IF EXIST "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WinRAR\" ( 
	IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\WinRAR\" ( 
		XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WinRAR\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WinRAR\" /y >nul
		echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WinRAR\" >nul
		rd "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WinRAR\" >nul
		echo ** WINRAR LINKS REMOVED! ** && echo.
	) ELSE (
		md "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\WinRAR\" >nul
		XCOPY "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WinRAR\" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\System Tools\WinRAR\" /y >nul
		echo y|del "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WinRAR\" >nul
		rd "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\WinRAR\" >nul
		echo ** WINRAR LINKS REMOVED! ** && echo.
	)
) ELSE	(
	echo Thankfully no WinRAR Links found! && echo.
	)
)
IF EXIST "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WinRAR\" ( 
	echo y|del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WinRAR\" >nul
	rd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WinRAR\" >nul
) ELSE (
	BREAK
)
TIMEOUT 1 > nul

:: ===============================
:: Other programs to check for ???
:: ===============================

:exit
echo. && echo ************************************* && echo. && echo CHECK COMPLETED! EXITING IN 3 SECONDS && echo. && echo ************************************* && echo.
TIMEOUT 3 > nul
exit
