call setEnvVars.bat

set START_TIME="%date:~0,10% %time:~0,2%:%time:~3,5%"
echo start time %START_TIME%
call %JAVA_HOME%/bin/java -version

call %GRADLE_HOME%/bin/gradle -version

call %GRADLE_HOME%/bin/gradle -b build_cnf_docker.gradle

pause