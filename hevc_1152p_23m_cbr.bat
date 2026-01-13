@echo off
chcp 65001 >nul

if "%~1"=="" (
  echo 사용법: hevc_1152p_23m_cbr.bat input.mkv
  pause
  exit /b
)

set INPUT=%~1
set NAME=%~n1
set DIR=%~dp1

ffmpeg -y -i "%INPUT%" ^
-vf "scale=2048:1152:flags=lanczos" ^
-c:v hevc_amf ^
-rc cbr ^
-b:v 23M -maxrate 23M -bufsize 46M ^
-profile:v main ^
-pix_fmt yuv420p ^
-g 120 ^
-movflags +faststart ^
-c:a copy ^
"%DIR%%NAME%_1152p_23M_CBR_HEVC.mp4"

echo.
echo 완료: %DIR%%NAME%_1152p_23M_CBR_HEVC.mp4
pause
