# **Onos-CLI Kullanma Kılavuzu**
### Onos-Cli Erişim
* Username: onos
* Password: rocks
```
jenkins@devmachine:~$ ssh -p 30115 onos@192.168.70.21
Password authentication
Password: 
Welcome to Open Network Operating System (ONOS)!
     ____  _  ______  ____     
    / __ \/ |/ / __ \/ __/   
   / /_/ /    / /_/ /\ \     
   \____/_/|_/\____/___/     
                               
Documentation: wiki.onosproject.org      
Tutorials:     tutorials.onosproject.org 
Mailing lists: lists.onosproject.org     

Come help out! Find out how at: contribute.onosproject.org 

Hit '<tab>' for a list of available commands
and '[cmd] --help' for help on a specific command.
Hit '<ctrl-d>' or type 'system:shutdown' or 'logout' to shutdown ONOS.
onos> 
```

### Cihazların Listelenmesi
``` devices``` komutu ile cihazlar listelenir.
```
onos> devices
id=of:0000000000000001, available=true, local-status=connected 3d19h ago, role=MASTER, type=SWITCH, mfr=Accton Corp., hw=x86-64-accton-as7712-32x-r0, sw=ofdpa 3.0.5.5+accton1.7-1, serial=771232X1744006, chassis=1, driver=ofdpa3, channelId=10.233.102.128:36021, locType=none, managementAddress=10.233.102.128, name=Fabric Switch - Leaf1, protocol=OF_13
id=of:00000000c0a8461e, available=true, local-status=connected 3d17h ago, role=MASTER, type=SWITCH, mfr=VOLTHA Project, hw=, sw=, serial=192.168.70.30:9191, chassis=c0a8461e, driver=voltha, channelId=10.233.75.23:37132, locType=none, managementAddress=10.233.75.23, name=olt-1, protocol=OF_13
```
* **id:** Cihazın openflow id'si
* **available:** Bağlantının olup işlem yapılabilirliği
* **local-status:** Ne kadar süredir bağlı olduğu
* **role:** Kontrolcünün cihaz üzerindeki rolü
* **type:** Cihaz tipi
* **mfr:** Cihazın üreticisi 
* **hw:** Cihazın modeli
* **sw:** Cihazın içinde yüklü olan yazılım sürümü
* **serial:** Cihazın seri numarası
* **chassis:** Şase numarası
* **driver:** Cihazın kontrolcünün içerisindeki eşleşeceği driver
* **channelId:** Cihazın kontrolcüye bağlandığı IP:TCP_Port bilgisi
* **managementAddress:** Cihazın yönetim IP adres bilgisi
* **name:** Cihazın ismi
* **protocol:** Cihazın kontrolcü ile konuşurken kullandığı protokol sürümü

### Cihazın Port Bilgilerini Listelenmesi
 * ``` ports ``` komutu ile bütün cihazların portları görüntülenir.
 ```
onos> ports
id=of:0000000000000001, available=true, local-status=connected 3d19h ago, role=MASTER, type=SWITCH, mfr=Accton Corp., hw=x86-64-accton-as7712-32x-r0, sw=ofdpa 3.0.5.5+accton1.7-1, serial=771232X1744006, chassis=1, driver=ofdpa3, channelId=10.233.102.128:36021, locType=none, managementAddress=10.233.102.128, name=Fabric Switch - Leaf1, protocol=OF_13
  port=1, state=enabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port1
  port=2, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port2
  port=3, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port3
  port=4, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port4
  port=5, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port5
  port=6, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port6
  port=7, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port7
  port=8, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port8
  port=9, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port9
  port=11, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port11
  port=12, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port12
  port=13, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port13
  port=14, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port14
  port=15, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port15
  port=16, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port16
  port=17, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port17
  port=18, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port18
  port=19, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port19
  port=21, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port21
  port=22, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port22
  port=23, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port23
  port=24, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port24
  port=25, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port25
  port=26, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port26
  port=27, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port27
  port=28, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port28
  port=29, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port29
  port=30, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port30
  port=31, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port31
  port=32, state=disabled, type=fiber, speed=100000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port32
  port=69, state=disabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port69
  port=70, state=disabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port70
  port=71, state=disabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port71
  port=72, state=enabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port72
  port=109, state=disabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port109
  port=110, state=disabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port110
  port=111, state=disabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port111
  port=112, state=disabled, type=fiber, speed=10000 , adminState=enabled, portMac=a8:2b:b5:d1:f3:ed, portName=port112
id=of:00000000c0a8461e, available=true, local-status=connected 3d17h ago, role=MASTER, type=SWITCH, mfr=VOLTHA Project, hw=, sw=, serial=192.168.70.30:9191, chassis=c0a8461e, driver=voltha, channelId=10.233.75.23:37132, locType=none, managementAddress=10.233.75.23, name=olt-1, protocol=OF_13
  port=16, state=enabled, type=fiber, speed=0 , adminState=enabled, portMac=08:00:00:00:00:10, portName=BRCM12345678
  port=32, state=disabled, type=fiber, speed=0 , adminState=enabled, portMac=08:00:00:00:00:20, portName=BRCM12345679
  port=65536, state=enabled, type=fiber, speed=0 , adminState=enabled, portMac=00:00:00:01:00:00, portName=nni-65536

 ```
 * * **port:** Port numarası
 * * **state:** Portun çalışma durumu
 * * **type:** Portun kullandığı kablo tipi
 * * **speed:** Portun hızı 
 * * **adminState:**  Portun provizyon durumu 
 * * **portMac:** Porta MAC adresi
 * * **portName:** Portun ismi

### Cihazın Akış Bilgilerini Listelenmesi
* ``` flows ``` komutu ile akışlar görüntülenir.
 ```
onos> flows
deviceId=of:0000000000000001, flowRuleCount=29
    id=17000019316342, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=10, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:20, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=17000030a7a322, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=10, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, VLAN_VID:None], treatment=DefaultTrafficTreatment{immediate=[VLAN_ID:4094], deferred=[], transition=TABLE:20, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000a3274c07, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=10, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:20, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000ab7e9067, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=10, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:20, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000bada63da, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=10, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:20, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000ecc14480, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=10, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, VLAN_VID:None], treatment=DefaultTrafficTreatment{immediate=[VLAN_ID:4094], deferred=[], transition=TABLE:20, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=17000002dfd614, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv4, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000160569f3, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv6, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=1700002b508fe6, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv6, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=1700002d25e24a, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, ETH_DST:00:00:02:01:06:01, ETH_TYPE:mpls_unicast, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:23, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000379ac64e, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv4, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=17000043fa9ce0, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv4, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=1700006e031db3, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv4, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=1700007654f3dc, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, ETH_DST:00:00:02:01:06:01, ETH_TYPE:mpls_unicast, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:23, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000a0a60490, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv6, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000a11e5737, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:72, ETH_DST:00:00:02:01:06:01, ETH_TYPE:mpls_unicast, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:23, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000a3d6bc74, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, ETH_DST:00:00:02:01:06:01, ETH_TYPE:mpls_unicast, VLAN_VID:4094], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:23, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000c60f7a15, state=ADDED, bytes=0, packets=0, duration=323549, liveType=UNKNOWN, priority=32768, tableId=20, appId=org.onosproject.segmentrouting, payLoad=null, selector=[IN_PORT:1, ETH_DST:00:00:02:01:06:01, ETH_TYPE:ipv6, VLAN_VID:4090], treatment=DefaultTrafficTreatment{immediate=[], deferred=[], transition=TABLE:30, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=1000015dfde79, state=ADDED, bytes=0, packets=0, duration=328073, liveType=UNKNOWN, priority=40000, tableId=60, appId=org.onosproject.core, payLoad=null, selector=[ETH_TYPE:eapol], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=true, StatTrigger=null, metadata=null}
    id=100002fb6ab5b, state=ADDED, bytes=10019040, packets=104365, duration=328671, liveType=UNKNOWN, priority=40000, tableId=60, appId=org.onosproject.core, payLoad=null, selector=[ETH_TYPE:lldp], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=true, StatTrigger=null, metadata=null}
    id=10000869678e2, state=ADDED, bytes=10019040, packets=104365, duration=328671, liveType=UNKNOWN, priority=40000, tableId=60, appId=org.onosproject.core, payLoad=null, selector=[ETH_TYPE:bddp], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=true, StatTrigger=null, metadata=null}
    id=10000cb4385b6, state=ADDED, bytes=0, packets=0, duration=323552, liveType=UNKNOWN, priority=40000, tableId=60, appId=org.onosproject.core, payLoad=null, selector=[ETH_TYPE:ipv4, IPV4_DST:192.168.0.201/32], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=true, StatTrigger=null, metadata=null}
    id=10000f9397650, state=ADDED, bytes=0, packets=0, duration=323552, liveType=UNKNOWN, priority=40000, tableId=60, appId=org.onosproject.core, payLoad=null, selector=[ETH_TYPE:ipv6, IPV6_DST:fe80::200:2ff:fe01:601/128], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=true, StatTrigger=null, metadata=null}
    id=17000016587419, state=ADDED, bytes=0, packets=0, duration=323552, liveType=UNKNOWN, priority=30000, tableId=60, appId=org.onosproject.segmentrouting, payLoad=null, selector=[ETH_TYPE:arp], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=17000020d613ec, state=ADDED, bytes=0, packets=0, duration=323552, liveType=UNKNOWN, priority=30000, tableId=60, appId=org.onosproject.segmentrouting, payLoad=null, selector=[ETH_TYPE:ipv6, IP_PROTO:58, ICMPV6_TYPE:134], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=17000049c0205d, state=ADDED, bytes=0, packets=0, duration=323552, liveType=UNKNOWN, priority=30000, tableId=60, appId=org.onosproject.segmentrouting, payLoad=null, selector=[ETH_TYPE:ipv6, IP_PROTO:58, ICMPV6_TYPE:135], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=1700006454ef5d, state=ADDED, bytes=0, packets=0, duration=323552, liveType=UNKNOWN, priority=30000, tableId=60, appId=org.onosproject.segmentrouting, payLoad=null, selector=[ETH_TYPE:ipv6, IP_PROTO:58, ICMPV6_TYPE:136], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=170000661c239f, state=ADDED, bytes=0, packets=0, duration=323552, liveType=UNKNOWN, priority=30000, tableId=60, appId=org.onosproject.segmentrouting, payLoad=null, selector=[ETH_TYPE:ipv6, IP_PROTO:58, ICMPV6_TYPE:133], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=1000008173504, state=ADDED, bytes=0, packets=0, duration=328052, liveType=UNKNOWN, priority=5, tableId=60, appId=org.onosproject.core, payLoad=null, selector=[ETH_TYPE:0x8863], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=true, StatTrigger=null, metadata=null}
deviceId=of:00000000c0a8461e, flowRuleCount=3
    id=b1000033e6c1bd, state=ADDED, bytes=0, packets=0, duration=0, liveType=UNKNOWN, priority=10000, tableId=0, appId=org.opencord.olt, payLoad=null, selector=[IN_PORT:65536, ETH_TYPE:lldp], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=b10000ac86255d, state=ADDED, bytes=0, packets=0, duration=0, liveType=UNKNOWN, priority=10000, tableId=0, appId=org.opencord.olt, payLoad=null, selector=[IN_PORT:65536, ETH_TYPE:ipv4, IP_PROTO:17, UDP_SRC:67, UDP_DST:68], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}
    id=b10000cf947457, state=ADDED, bytes=0, packets=0, duration=0, liveType=UNKNOWN, priority=10000, tableId=0, appId=org.opencord.olt, payLoad=null, selector=[IN_PORT:16, ETH_TYPE:eapol], treatment=DefaultTrafficTreatment{immediate=[OUTPUT:CONTROLLER], deferred=[], transition=None, meter=[], cleared=false, StatTrigger=null, metadata=null}

 ```
  * * **id:** Akışın id'si
  * * **state :** Akışın switch'e eklenip eklenemediği durumu
  * * **bytes:** Toplam eşleşen byte değeri
  * * **packets:** Akışa eşleşen toplam paket sayısı
  * * **duration:** Akışın ne kadar süredir switch'in üzerinde bulunduğu
  * * **prioriy:** Akışın önceliği
  * * **tableId:** Akışın eşleşeceği openflow tablo numarası
  * * **appId:** Akışı hangi uygulamanın kurduğu bilgisi
  * * **selector:** Akışın özel olarak eşleşeceği seçenekleri (Giriş portu, MAC adresi, Vlan Etiketi gibi)
  * * **treatment:** Akış eşleşirse ona uygulanacak aksiyon
  * * **transition:** Akışın eşleştikten sonra gideceği tablo numarası
  * * **meter:** Akışa eklencek meter değeri

  
### LOG Bilgileri
* ```log:list``` komutu ile log seviyesi görüntülenir.
```
onos> 
Logger | Level
--------------
ROOT   | INFO 
```
* ```log:set level``` komutu ile level yerine istenilen seviye (TRACE, DEBUG, INFO, WARN, ERROR) yazılıp log seviyesi değiştirilir.

* ```log:tail``` komutu ile loglar anlık olarak cli ekranına bastırılır.

* ```log:display``` komutu ile var olan loglar görüntülenir.

```
onos> log:display 
2018-12-10 08:10:10,834 | WARN  | .233.75.23:37132 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing
2018-12-10 08:10:11,493 | WARN  | 33.102.128:36021 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing
2018-12-10 08:10:11,532 | WARN  | 33.102.128:36021 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing
2018-12-10 08:10:13,898 | WARN  | .233.75.23:37132 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing
2018-12-10 08:10:14,607 | WARN  | 33.102.128:36021 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing
2018-12-10 08:10:14,639 | WARN  | 33.102.128:36021 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing
2018-12-10 08:10:17,012 | WARN  | .233.75.23:37132 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing
2018-12-10 08:10:17,721 | WARN  | 33.102.128:36021 | DhcpL2Relay                      | 198 - org.opencord.dhcpl2relay - 1.5.0.SNAPSHOT | Missing DHCP relay config. Abort packet processing

```

### vOLTHA Bilgileri
* ```volt-olts``` komutu ile provizyonlanmış OLT'ler listelenir.
```
onos> volt-olts 
OLT of:00000000c0a8461e
```
* ```volt-add-subscriber-access deviceId port``` komutu ile OLT'ye bağlı olan ONT'ler abone olarak eklenir.
* ```volt-subscribers``` komutu ile aboneler listelenir.