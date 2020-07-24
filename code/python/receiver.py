import socket
import struct
import sys
import threading
import random
import time
import RPi.GPIO as GPIO
import string

APP_LISTENING_THREAD_PORT = 20000
BUFFER = 1024
LED_PIN = 14

def filterAscii(inStr):
	i = 0
	for c in inStr:
		i += 1
		if c in string.ascii_letters:
			break
	inStr = inStr[i:]

def gpioInit(pin):
	GPIO.setmode(GPIO.BCM)
	GPIO.setwarnings(False)
	GPIO.setup(pin, GPIO.OUT, initial=GPIO.LOW)
	time.sleep(1)
	GPIO.output(pin,GPIO.LOW)

def appCommunicationThread(client_sock):
	while True:
		data = client_sock.recv(BUFFER).decode('utf-8')
		data = filterAscii(data)
		if data == "ON":
			GPIO.output(LED_PIN,1)
		elif data == "OFF":
			GPIO.output(LED_PIN,0)
		elif data == "DONE":
			break
		print(data)
		time.sleep(1)

def appListeningThread():
	server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	server_sock.setblocking(True)
	server_sock.bind(('',APP_LISTENING_THREAD_PORT))
	server_sock.listen(1)
	# Constantly accept connections clients
	while True:
		client_sock, address = server_sock.accept()
		threading.Thread(target=appCommunicationThread,args=(client_sock,)).start()

def multicastListeningThread():
	multicast_group = '224.3.29.71'
	server_address = ('',10000)

	sock_obj = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	sock_obj.bind(server_address) # Listen for outside connections

	group = socket.inet_aton(multicast_group)
	mreq = struct.pack('4sL', group, socket.INADDR_ANY)
	sock_obj.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)

	while True:
		data, address = sock_obj.recvfrom(1024)
		print('data: ' + str(data))
		print('address: ' + str(address))
		sock_obj.sendto('iRobot Create 2'.encode('utf-8'),address)
		#threading.Thread(target=appCommunicationThread, args=(address,)).start()

if __name__ == '__main__':
	gpioInit(LED_PIN)
	threading.Thread(target=multicastListeningThread).start()
	threading.Thread(target=appListeningThread).start()

