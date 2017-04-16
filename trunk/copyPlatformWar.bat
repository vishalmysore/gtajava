
pushd c:\My_Applications\tomcat7\apache-tomcat-7.0.30\webapps
rmdir /S /Q gtajava
del gtajava.war
cd c:\My_Applications\tomcat7\apache-tomcat-7.0.30\logs
del /Q *.*
copy C:\My_Applications\GtaJava\gtajava\trunk\target\gtajava.war c:\My_Applications\tomcat7\apache-tomcat-7.0.30\webapps
popd
tomcat.bat