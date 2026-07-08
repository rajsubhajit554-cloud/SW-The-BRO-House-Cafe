@echo off
:: Enable local variable scope and color/formatting if supported
title Git Auto-Update Script
echo ===================================================
echo   Git Repository Auto-Updater for The BRO House Cafe
echo ===================================================
echo.

:: Stage all files (respects .gitignore)
echo [1/4] Staging all files...
git add .
if %errorlevel% neq 0 (
    echo Error: Failed to stage files.
    goto error
)
echo Success: Files staged.
echo.

:: Prompt for commit message
echo [2/4] Commit details...
set "commit_msg="
set /p commit_msg="Enter a commit message (default is 'update'): "
if "%commit_msg%"=="" set commit_msg=update
echo.

:: Commit changes
echo [3/4] Committing changes...
git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo.
    echo Info: No changes to commit or commit failed.
) else (
    echo Success: Committed successfully.
)
echo.

:: Push changes to remote main branch
echo [4/4] Pushing changes to GitHub (origin/main)...
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo Error: Failed to push to remote repository.
    echo Please check your internet connection or GitHub permissions.
    goto error
)
echo Success: Pushed to GitHub!
echo.
echo ===================================================
echo   Git Update Finished Successfully!
echo ===================================================
goto end

:error
echo ===================================================
echo   An error occurred. Update failed!
echo ===================================================

:end
pause
