@echo off
setlocal

REM 切换到 financial-study 仓库目录
cd /d d:\Study\CFP-Study-main\financial-study

REM 将所有变更加入暂存区
git add .

REM 如果有需要提交的变更才提交
git diff --cached --quiet
IF %ERRORLEVEL% NEQ 0 (
    set msg=Auto sync %date% %time%
    git commit -m "%msg%"
    git push origin main
) ELSE (
    echo No changes to commit.
)

endlocal

