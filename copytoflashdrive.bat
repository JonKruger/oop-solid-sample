if '%1x'=='x' goto fail

%1:
cd \
del *
rd /S .
xcopy /E /S "c:\proj\oop-solid-sample\code\*" "%1:\"
c:
cd \proj\oop-solid-sample
goto exit

:fail
echo pass a drive letter

:exit