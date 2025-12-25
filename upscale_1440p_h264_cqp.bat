@echo off
chcp 65001 >nul

if "%~1"=="" (
  echo 사용법: upscale_1440p_h264_cqp.bat input.mkv
  pause
  exit /b
)

set INPUT=%~1
set NAME=%~n1
set DIR=%~dp1

ffmpeg -y -i "%INPUT%" ^
-vf "scale=2560:1440:flags=lanczos,unsharp=5:5:0.2:3:3:0.0" ^
-c:v h264_amf ^
-rc cqp ^
-qp_i 18 -qp_p 20 -qp_b 22 ^
-profile high ^
-pix_fmt yuv420p ^
-g 120 ^
-movflags +faststart ^
-c:a copy ^
"%DIR%%NAME%_1440p_H264_CQP.mp4"

echo.
echo 완료: %DIR%%NAME%_1440p_H264_CQP.mp4
pause
