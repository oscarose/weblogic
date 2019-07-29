#!/bin/bash
java -cp /u01/udemy/Oracle/Middleware/Oracle_Home/wlserver/server/lib/weblogic.jar weblogic.Deployer -verbose -noexit -adminurl t3://54.156.62.113:7001/console/login/LoginForm.jsp -user $1 -password $2 -name mainWebApp -start start  -timeout 300
