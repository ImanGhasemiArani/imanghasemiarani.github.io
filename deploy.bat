@REM echo on
call flutter clean
call flutter build web --web-renderer html
call xcopy /s /y /r build\web D:\Dev_Files\GitHub\imanghasemiarani.github.io\.
call cd D:\Dev_Files\GitHub\imanghasemiarani.github.io
call d:
call git add .
call git commit -m "update"
call git push
@REM pause