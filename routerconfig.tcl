
#ASSIGN IP
#---------------------
interface "INTERFACE"
ip address "IP" "MASK"
description "DESCRIPTION"
no shutdown

#SWITCHPORT SECURITY
#-------------------------
switchport mode access|trunk
switchport port-security
switchport port-security maximum "NUMBER"
switchport port-security mac-address (sticky) "MAC-ADDRESS"
switchport port-security violation restrict|shutdown

show port-security interface "x#"

#ENABLE PASSWORD
#----------------------
enable secret "PASSWORD"
service password-encryption

#MOTD BANNER
#------------------------
banner motd "MESSAGE"

#VLAN SETUP
#----------------------
interface vlan "1"
ip address "IP"
no shutdown

#TELNET
#----------------------------
line vty 0 15
password "PASSWORD"
login
transport input telnet

#RIP
#----------------------------
router rip
version 2 
no auto-summary
passive-interface "INTERFACE"
network "IP"

default-information origionate

#STATIC ROUTE
#----------------------------
ip route "network" "subnet" "nexthop"

#SSH 
#--------------------------
ip domain-name cisco.com
crypto key generate rsa
 ------1024 bits-----
ip ssh version "2"
username "USERNAME" secret "PASSWORD"
line vty 0 15
transport input ssh
login local 

#VLAN
#---------------------------- 
vlan "vlanid"
name "vlanname"

interface "INTERFACE"
switchport mode access|trunk
switchport access vlan "NUMBER"

interface "INTERFACE"
switchport mode trunk
switchport trunk native vlan "NUMBER"
switchport trunk allowed vlan "NUMBER1,NUMBER2,NUMBER3"

#ROUTER SUBINTERFACES(stick)
#----------------------------------
Interface "INTERFACE"."NUMBER"
encapsulation dot1q "NUMBER"
ip address "IP" "MASK"
interface "INTERFACE"
no shutdown

#DHCP
#----------------------------------
ip dhcp excluded-addresses '"IP-START" "IP-FINISH"
ip dhcp pool "NAME"
network "IP" "MASK"
dns-server "IP"
default router "IP"

#ACCESSLIST(acl)
#----------------------------------
access-list "NUMBER" permit|deny "IP" "WILDCARD"

ip access-list extended/standard name
permit ip|any|host "IP" "WILDCARD" any|host|ip

# STATIC NAT
#-------------------------------
ip nat inside source static "LOCALIP" "GLOBALIP"

interface "INTERFACE"
ip nat inside/outside

show nat translations

#DYNAMIC NAT/PAT
#------------------------------------
ip nat pool "NAME" "IP-START" "IP-STOP" netmask "MASK"
access list "NUMBER" permit "IP" "WILDCARD"
ip nat inside source list "NUMBER" pool "NAME" (overload)
interface "INTERFACE"
ip nat inside|outside

show nat translations

#SCALING VLANS
#-------------------------------------
Vtp domain "NAME"
vtp password "PASSWORD"
vtp mode server|client|transparent
vtp version 1|2

show vtp status

#DYNAMIC TRUNKING PROTOCOL(dtp)
#------------------------------------
Switchport mode dynamic|auto|desirable 
Switchport mode trunk 
Switchport nonegotiate

show dtp interface

#SPANNING TREE PROTOCOLOL(stp)
#--------------------------------------
spanning-tree vlan "NUMBER"
spanning-tree vlan "NUMBER" root primary|secondary
spanning-tree vlan "NUMBER" priority "NUMBER" 
# priority must be adjusted in 4096 segments

show spanning-tree "vlan#"
show spanning-tree summary

#ETHERCHANNEL
#---------------------------------------
interface range "START-FINISH"
channel-group "NUMBER" mode active|passive|desirable
interface port-channel "NUMBER"
switchport mode trunk
switchport trunk allowed vlan "NUMBER,NUMBER2,NUMBER3"

show interfaces port-channel
show etherchannel summary
show etherchannel port-channel

#FIRST HOP REDUNDANCY PROTOCOL(fhrp)
#----------------------------------------
Interface "INTERFACE" 
#the default gateway interface

standby version 2
standby "GROUP NUMBER" "FHRP-IP-VIRTUAL"
standby "GROUP NUMBER" priority "0-255"
#highest is primary priority, default is 100

standby "GROUP NUMBER" preempt
standby "GROUP NUMBER" name "GROUP NAME"

show standby
show standby brief
debug standby packets
debug standby terse

#EIGRP
#-----------------------------------------
router eigrp "PROCESS-ID"
	ip route "IP" "MASK" "INTERFACE"
	redistribute static
	eigrp router-id "1.1.1.1"
	network "NETWORK-ID" (MASK)
	passive-interface "Interface"
interface "INTERFACEE"
	ip bandwidth-percent eigrp "PROCESS-ID" "PERCENTAGE"
	ip hello-interval eigrp "PROCESS-ID" "SECS"
	ip hold-time eigrp "PROCESS-ID" "SECS" 
	bandwidth "SPEED-KBPS"

show ip protocols
show ip eigrp neighbors
show interfaces
show ip eigrp topology
show ip route eigrp

#OSPF
#-----------------------------------------
router ospf "PROCESS-ID" 
	network "NETWORK-ID" "MASK" area "NUMBER" 
	#area 0 for single area OSPF
	router-id "x.x.x.x"
	auto-cost reference bandwidth "NUMBER"
ip ospf hello-interval "SECS"
ip ospf dead-interval "SECS"

ipv6 router ospf "PROCESS-ID"
#ipv6 must be assigned to individual interfaces

int "INTERFACE"
	ipv6 ospf "NETWORK-ID" "MASK" area "NUMBER"
	bandwidth "bandwidthValue"
ip ospf cost "value"
ip router-priority "1-255"

show ipv6 ospf interface
show ip ospf interface
show ip ospf neighbor
show ip ospf database
show ip route
show ip ospf interface brief
clear ip ospf process 

#PPP
#--------------------------------------
interface "INTERFACE"
encapsulation hdlc 
#cisco default

encapsulation ppp

ppp quality "0-100"
ppp multilink
ppp multilink group "NUMBER"

show ppp multilink
show interfaces
show interfaces "INTERFACE"
debug ppp negotiation

#pap
hostname "NAME"
username "NAME" password "PASSWORDD"
int "INTERFACE"
	ppp authentication pap 
	ppp pap sent-username "NAME" password"PASSWORD"

#chap
hostname "NAME"
username "USERNAME" password "PASSWORD"
int "INTERFACE"
	ppp authentication chap
#Both ends need the same password with chap, there is no sent-credentials

#PPPoE
#-------------------------------------------
interface dailer "#"
	encapsulation ppp
	ip address negotiated
	ppp chap hostname "USERNAME"
	ppp chap password "PASSWORD"
	ip mtu "1492" #adjust packet size
	dialer pool "NUMBER"
no shutdown

interface "INTERFACE"
	no ip address
	pppoe enable
	pppoe-client dial-pool-number "POOL-NUMBER"
       	#binds the interface to the dialer pool previously created
no shutdown

ip tcp adjust-mss 1452 
#adjust tcp 3-wayhandshake packet size

show interface dialer
show pppoe session
show ip int b
debug ppp negotiation

#GRE TUNNEL
#---------------------------------------------
interface tunnel "NUMBER"
	tunnel mode gre ip
	ip address "IP" "MASK" 
	#make one up

	tunnel source "IP" 
	tunnel destination "IP" 
	#the physical interfaces|ips

router "OSPF"
network "IP" "MASK" area "NUMBER" 
#The made up one 

show interface tunnel "#"

#EXTERNAL-BGP
#--------------------------------------------
router bgp "ASnumber"
neighbor "IP" remote-as "ASnumber"
network "IP" mask "MASK"

show ip bgp 
show ip bgp summary

## SNMP V2C
#------------------------------------------------
#UDP port 162 for manager software
snmp-server community "COMMUNITY-NAME" "ro/w/rwe" "ACL-NAME"

#optional credentials/documentation
snmp-server location 	"SNMP-MGR-NAME"
snmp-server contact	"YOUR-NAME"	

snmp-server host "IP" version "1/2c/3" "COMMUNITY-NAME"
snmp-server enable traps

ip access-list standard	`"ACL-NAME"
permit	"IP"


show snmp
show snmp community

## SNMP V3
#-----------------------------------------------------
ip access-list standard "ACL-NAME"
permit "SOURCE-NETWORK"

snmp-server view "VIEW-NAME" "OLD-TREE"
snmp-server group "GROUP-NAME" v3 priv read "VIEW-NAME" access "ACL-NAME/NUMBER"
snmp-server user "USER-NAME" "GROUP-NAME" v3 auth MD5|SHA "AUTH-PASSWORD" priv des|3des|aes(128|192|256) "PRIV-PASSWORD"


# SWITCHPORT ANALYZER
# ----------------------------------------------------
monitor session "NUMBER" source interface|vlan "NUMBER"
monitor session "NUMBER" destination interface|vlan "NUMBER"















