set LOVE_NAME=Brugga
set LOVE_INCLUDE_DIRS=assets entities gamestates lib physics player ui

zip -r %LOVE_NAME%.zip %LOVE_INCLUDE_DIRS% conf.lua main.lua README.md
rename %LOVE_NAME%.zip %LOVE_NAME%.love
mkdir release\%LOVE_NAME%_Windows
copy /b love.exe+%LOVE_NAME%.love release\%LOVE_NAME%_Windows\%LOVE_NAME%.exe
del %LOVE_NAME%.love
copy release\dist\* release\%LOVE_NAME%_Windows
cd release
zip -r %LOVE_NAME%_Windows.zip %LOVE_NAME%_Windows

