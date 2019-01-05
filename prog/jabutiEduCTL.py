#!/usr/bin/python2.7
#coding: utf-8

import RPi.GPIO as gpio
import time
import serial

running 	= False
setGPIO		= False

PORT 		= "/dev/rfcomm0"
BAUDRATE	= 9600
PIN_S1		= 7
PIN_S2		= 11
FREG		= 400

while True:
	try:
		bluetoothSerial = serial.Serial( PORT, baudrate=BAUDRATE )
		running = True

		gpio.setwarnings(False)
		gpio.setmode(gpio.BOARD)
		gpio.setup(PIN_S1, gpio.OUT)
		gpio.setup(PIN_S2, gpio.OUT)

		servo1 = gpio.PWM(PIN_S1, FREG)
		servo1.start(0)
		servo2 = gpio.PWM(PIN_S2, FREG)
		servo2.start(0)
		setGPIO = True

		while True:
			cmd = bluetoothSerial.readline()
			cmd = cmd.upper()
			print cmd.encode('hex')
			bluetoothSerial.write(cmd)

			if(cmd == "F\r\n"):
				servo1.ChangeDutyCycle(99)
				servo2.ChangeDutyCycle(1)
			if(cmd == "T\r\n"):
				servo1.ChangeDutyCycle(1)
				servo2.ChangeDutyCycle(99)
			if(cmd == "E\r\n"):
				servo1.ChangeDutyCycle(99)
				servo2.ChangeDutyCycle(99)
			if(cmd == "D\r\n"):
				servo1.ChangeDutyCycle(1)
				servo2.ChangeDutyCycle(1)
			if(cmd == "S\r\n"):
				servo1.ChangeDutyCycle(0)
				servo2.ChangeDutyCycle(0)


	############################################################################
	except :
		print "porta não enconrada"
		time.sleep(1)
		if(setGPIO == True):
			gpio.cleanup()
		if(running == True):
			exit()
	############################################################################
exit()
