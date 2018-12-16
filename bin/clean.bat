setlocal
set RAILS_ENV=production
rem SECRET_KEY_BASE and CRK2_HOME should be set as system environment variables.
cd %CRK2_HOME%
jruby -S rake assets:precompile
del %CRK2_HOME%\tmp\pids\server.pid
pause
endlocal
