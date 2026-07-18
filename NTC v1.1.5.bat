@echo off
title Network Traffic Capturing Batch Edition by @POt3tO (my youtube) v1.1.4
echo =======================================================================
echo UDP - 1
echo TCP - 2
echo TLS - 3
echo stun - 4 [for online calls, snap, dischord, etc] (fixed)
echo ALL - 5 (cluttered)
echo IPv4 - 6
echo IPv6 - 7
echo =======================================================================
echo enter the number corrisponded to the filter next to it.
set /p mode="Enter mode: "
if "%mode%"=="1" goto a
if "%mode%"=="2" goto b
if "%mode%"=="3" goto c
if "%mode%"=="4" goto d
if "%mode%"=="5" goto e
if "%mode%"=="6" goto f
if "%mode%"=="7" goto g
:a
cls
pktmon stop
pktmon filter remove
cls
pktmon filter add -t UDP
pktmon start --etw -m real-time

:b 
cls
pktmon stop
pktmon filter remove
cls
pktmon filter add -t TCP
pktmon start --etw -m real-time

:c
cls
pktmon stop
pktmon filter remove
cls
pktmon filter add -p 443
pktmon start --etw -m real-time

:d
cls
pktmon stop
pktmon filter remove
cls
pktmon filter add -p 3478
pktmon start --etw -m real-time

:e
cls 
pktmon stop
pktmon filter remove
cls
pktmon start --etw -m real-time

:f

cls
pktmon stop
pktmon filter remove
cls
pktmon start --etw -m real-time | findstr IPv4

:g
pktmon stop
pktmon filter remove
cls
pktmon start --etw -m real-time | findstr IPv6
