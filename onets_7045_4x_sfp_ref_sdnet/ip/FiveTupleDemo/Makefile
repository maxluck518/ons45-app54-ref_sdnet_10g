ROOT_DIR	:= ./
include		../Makefile.mk

SDNET_NAME	:= FiveTupleDemo
FLAGS 		:= -busType axi -busWidth 256 -lineClock 125 -lookupClock 76.923080 -controlClock 76.923080 -singleControlPort

sdnet :
	$(SDNET) $(SDNET_NAME).sdnet $(FLAGS) -workDir work_$(SDNET_NAME) # -packetFile Packet.pcap -tupleFile Tuple.user

clean :
	rm -rf work_$(SDNET_NAME)/
	rm -f *vivado*

