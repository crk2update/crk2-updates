setlocal
rem if you encounter problems running bin\start.bat, then try to run bin\clean again first.
set RAILS_ENV=production
rem SECRET_KEY_BASE and CRK2_HOME should be set as system environment variables.
cd %CRK2_HOME%
jruby -S rails s -p 80
endlocal
