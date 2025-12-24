@echo off
setlocal

REM Change to financial-study repo directory
cd /d d:\Study\CFP-Study-main\financial-study

REM 1) Pull latest changes from remote first
git pull --rebase origin main
IF %ERRORLEVEL% NEQ 0 (
    echo Git pull failed. Please resolve conflicts or check network, then rerun this script.
    goto :EOF
)

REM 2) Stage all local changes
git add .

REM 3) Commit and push only if there are staged changes
git diff --cached --quiet
IF %ERRORLEVEL% NEQ 0 (
    set msg=Auto sync %date% %time%
    git commit -m "%msg%"
    git push origin main
) ELSE (
    echo No changes to commit.
)

endlocal
