@echo off
chcp 65001 >nul

if "%~1"=="" (
  echo 사용법: hevc_1152p_vbr20m.bat input.mkv
  pause
  exit /b
)

set INPUT=%~1
set NAME=%~n1
set DIR=%~dp1

ffmpeg -y -i "%INPUT%" ^
-vf "scale=2048:1152:flags=lanczos" ^
-c:v hevc_amf ^
-rc vbr ^
-b:v 20M -maxrate 30M -bufsize 40M ^
-profile:v main10 ^
-pix_fmt yuv420p10le ^
-g 120 -idr_interval 120 ^
-movflags +faststart ^
-c:a copy ^
"%DIR%%NAME%_1152p_HEVC_VBR20M.mp4"

echo.
echo 완료: %DIR%%NAME%_1152p_HEVC_VBR20M.mp4
pause
