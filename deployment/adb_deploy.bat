@echo off
echo ================================================
echo   Qwen3-0.6B GGUF Deployment to Pixel 6
echo ================================================
echo.

REM Check ADB connection
adb devices | findstr /r "device$" >nul 2>&1
if errorlevel 1 (
    echo [ERROR] No device connected!
    echo   1. Enable USB Debugging on your phone
    echo   2. Connect via USB
    echo   3. Accept the debugging prompt on your phone
    pause
    exit /b 1
)

echo [1/3] Creating model directory on device...
adb shell "mkdir -p /data/local/tmp/models"

echo [2/3] Pushing model files...
adb push ..\models\Qwen3-0.6B.Q4_K_M.gguf /data/local/tmp/models/
adb push ..\models\tokenizer.json /data/local/tmp/models/

echo [3/3] Setting permissions...
adb shell "chmod 644 /data/local/tmp/models/*"

echo.
echo ================================================
echo   Deployment Complete!
echo ================================================
echo   Model location: /data/local/tmp/models/
echo.
echo   Next steps:
echo   1. Open PocketPal AI or similar GGUF app
echo   2. Import model from /data/local/tmp/models/
echo   3. Start chatting!
echo ================================================
pause
