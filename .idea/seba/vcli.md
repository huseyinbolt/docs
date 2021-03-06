# **vCli Kullanma Kılavuzu**
vCli, SEBA'nın voltha modülünü komut satırı üzerinden yönetmek kullanılan arabirimdir. Bu arabirim SEBA ürününde ayrı bir pod olarak çalışır. Voltha komut satırına bağlanmak için vcli servisinin açtığı port üzerinden aşağıdaki kimlik bilgileri ile giriş yapılabilir.
### vCli Erişim
* Username: voltha
* Password: admin

Komut satırı arabirimine erişmek için açılan servis portuna aşağıdaki gibi ssh ile bağlanılır. Örnekte kullanılan 192.168.70.21 IP'si Kubernetes node IP'sidir. Bu IP yerine cluster'da yer alan herhangi bir node'un IP'si de yazılabilir.
```
ssh -p 30110 voltha@192.168.70.21
voltha@192.168.70.21's password: 
Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-21-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

         _ _   _            ___ _    ___
__ _____| | |_| |_  __ _   / __| |  |_ _|
\ V / _ \ |  _| ' \/ _` | | (__| |__ | |
 \_/\___/_|\__|_||_\__,_|  \___|____|___|
(to exit type quit or hit Ctrl-D)
(voltha) 

```
### Adaptörlerin Listelenmesi
Sistemin desteklediği OLT/ONT cihazlarının listesine erişmek için ```adapters``` komut kullanılır. Komut çıktısında adaptörün id'si, üreticisi ve voltha'nın içerisine yüklü olan versiyon numarası sağlanır.
```
(voltha) adapters
Adapters:
+----------------------+---------------------------+---------+
|                   id |                    vendor | version |
+----------------------+---------------------------+---------+
|                 acme |                 Acme Inc. |     0.1 |
|           adtran_olt |              ADTRAN, Inc. |    1.30 |
|           adtran_onu |              ADTRAN, Inc. |    1.21 |
|        asfvolt16_olt |                  Edgecore |    0.98 |
|             bbsimolt |                      CORD |     0.1 |
|    brcm_openomci_onu |            Voltha project |    0.50 |
|         broadcom_onu |            Voltha project |    0.46 |
|     cig_openomci_onu |                  CIG Tech |    0.10 |
|             dpoe_onu |   Sumitomo Electric, Inc. |     0.1 |
|            maple_olt |            Voltha project |     0.4 |
+----------------------+---------------------------+---------+
|        microsemi_olt |     Microsemi / Celestica |     0.2 |
|              openolt |      OLT white box vendor |     0.1 |
|             pmcs_onu |                      PMCS |     0.1 |
|           ponsim_olt |            Voltha project |     0.4 |
|           ponsim_onu |            Voltha project |     0.4 |
|        simulated_olt |            Voltha project |     0.1 |
|        simulated_onu |            Voltha project |     0.1 |
|          tellabs_olt |              Tellabs Inc. |     0.1 |
| tellabs_openomci_onu |              Tellabs Inc. |     0.1 |
|            tibit_olt | Tibit Communications Inc. |     0.1 |
+----------------------+---------------------------+---------+
|            tibit_onu | Tibit Communications Inc. |     0.1 |
|             tlgs_onu |                      TLGS |     0.1 |
+----------------------+---------------------------+---------+

```
### Cihazların Listelenmesi
Sisteme bağlı veya daha önce bağlanmış ve çıkartılmış cihazların (OLT/ONT) listesine erişmel için ``` devices``` komutu kullanılır.
```
(voltha) devices
Devices:
+------------------+-------------------+------+------------------+--------------------+-------------+-------------+----------------+----------------+--------------------+-----------------+-------------------------+----------------------+------------------------------+
|               id |              type | root |        parent_id |      serial_number | admin_state | oper_status | connect_status | parent_port_no |      host_and_port |          reason | proxy_address.device_id | proxy_address.onu_id | proxy_address.onu_session_id |
+------------------+-------------------+------+------------------+--------------------+-------------+-------------+----------------+----------------+--------------------+-----------------+-------------------------+----------------------+------------------------------+
| 0001e3129c807616 |           openolt | True | 00010000c0a8461e | 192.168.70.30:9191 |     ENABLED |      ACTIVE |      REACHABLE |                | 192.168.70.30:9191 |                 |                         |                      |                              |
| 0001e428c6f10c6b | brcm_openomci_onu | True | 0001e3129c807616 |       BRCM12345678 |    DISABLED |             |    UNREACHABLE |      536870912 |                    | omci-admin-lock |        0001e3129c807616 |                    1 |                            1 |
+------------------+-------------------+------+------------------+--------------------+-------------+-------------+----------------+----------------+--------------------+-----------------+-------------------------+----------------------+------------------------------+
```

Bu çıktıdaki sütunlar ve açıklamaları aşağıdaki gibidir:
* **id:** Cihazın fiziksel device id değeri
* **type:** Cihazın kullandığı adaptör
* **parent_id:** Cihazın bağlı olduğu bir üst cihazın id'si
* **serial_number:** Cihazın seri numarası
* **admin_state:** Cihazın provizyon durumu 
* **oper_status:** Cihazın çalışma durumu
* **connect_status:** Cihazın sisteme bağlı olma durumu
* **parent_port_no:** Bağlı olduğu cihaza bağlı olduğu port numarası
* **host_and_port:** OLT cihazı için IP ve Tcp Port bilgisi
* **reason:** Cihazın durumunun sebebi

### Cihazın İçerisine Girilmesi
``` devices``` komutu çıktısından içerisine girilmesi istenilen cihazın id'si elde edilir.<br/>
```
(voltha) device [id]
```
komutu ile istenilen cihazın içerisine girilir.<br/>
```
(voltha) device 0001e3129c807616
(device 0001e3129c807616) 
```
Cihazın içerisinde çalıştırılabilecek komutlar:<br/>
 * ``` ports ``` komutu<br/>
 ```
 (device 0001e3129c807616) ports
 Device ports:
 +-----------+--------------+--------------+-------------+-------------+------------------+
 |   port_no |        label |         type | admin_state | oper_status |        device_id |
 +-----------+--------------+--------------+-------------+-------------+------------------+
 | 536870912 |         pon0 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 |     65536 |    nni-65536 | ETHERNET_NNI |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870913 |         pon1 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870914 |         pon2 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870915 |         pon3 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870916 |         pon4 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870917 |         pon5 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870918 |         pon6 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870919 |         pon7 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870920 |         pon8 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 +-----------+--------------+--------------+-------------+-------------+------------------+
 | 536870921 |         pon9 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870922 |        pon10 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870923 |        pon11 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870924 |        pon12 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870925 |        pon13 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870926 |        pon14 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 | 536870927 |        pon15 |      PON_OLT |     ENABLED |      ACTIVE | 0001e3129c807616 |
 |        16 | BRCM12345678 | ETHERNET_UNI |     ENABLED |  DISCOVERED | 0001e3129c807616 |
 +-----------+--------------+--------------+-------------+-------------+------------------+
 ```
 * * **port_no:** Port numarası
 * * **label:** Port etiketi
 * * **type:** Portun kullandığı fiber tipi
 * * **admin_state:** Portun provizyon durumu 
 * * **oper_status:**  Portun çalışma durumu
 * * **device_id:** Porta sahip olan cihazın id'si
 
* ``` flows ``` komutu
 ```
 (device 0001e3129c807616) flows
 Device 0001e3129c807616 (type: openolt)
 Flows (3):
 +----------+----------+-----------+---------+----------+----------+----------+---------+---------+--------------+--------------+----------+-----------+------------+------------+
 | table_id | priority |    cookie | in_port | vlan_vid | eth_type | ip_proto | udp_src | udp_dst |     metadata | set_vlan_vid | pop_vlan | push_vlan |     output | goto-table |
 +----------+----------+-----------+---------+----------+----------+----------+---------+---------+--------------+--------------+----------+-----------+------------+------------+
 |        0 |    10000 | ~43034f7e |      16 |          |      800 |       17 |      68 |      67 |              |              |          |           | CONTROLLER |            |
 |        1 |     1000 | ~083d43df |      16 |       33 |          |          |         |         |              |            7 |          |      8100 |      65536 |            |
 |        0 |     1000 | ~ce8ba3b1 |   65536 |        7 |          |          |         |         | 141733920784 |              |      Yes |           |            |          1 |
 +----------+----------+-----------+---------+----------+----------+----------+---------+---------+--------------+--------------+----------+-----------+------------+------------+

 ```
  * * **table_id:** Akışın girdiği tablo numarası
  * * **prioriy:** Akışın önceliği
  * * **cookie :** Her akış için eşsiz bir sayı
  * * **in_port :** Akışın cihaza gireceği port numarası
  * * **vlan_vid :** Akışın eşleşeceği vlan etiketi
  * * **eth_type :** Akışın eşleşeceği ethernet tipi
  * * **ip_proto :** Akışın eşleşeceği IP Protokolü
  * * **udp_src :** Akışın eşleşeceği UDP Source Port numarası
  * * **udp_dst :** Akışın eşleşeceği UDP Destination Port numarası
  * * **metadata :** Akışın eşleşeceği ek bilgi
  * * **set_vlan_vid :** Akışın içerisindeki vlan etiketi değiştirilcekse, değiştirilecek vlan etiketi 
  * * **pop_vlan :** Akışın içerisindeki vlan etiketi çıkartılacaksa, çıkartılacak vlan etiketi
  * * **push_vlan :** Akışın içerisine vlan etiketi eklenecekse, eklenecek vlan etiketi
  * * **output :** Akışın cihazdan çıkacağı port numarası
  * * **goto-table :** Akışın eşleştikten sonra gideceği tablo numarası
  
### Mantıksal Cihazların Listelenmesi
SDN kontrolcü OLT/ONT cihazlarını tek bir mantıksal (logical) aygıt olarak görür. Bu aygıtların listesine erişmek için ``` logical devices``` komutu kullanılır.
```
(voltha) logical_devices
Logical devices:
+------------------+------------------+------------------+--------------------+---------------------------+--------------------------+
|               id |      datapath_id |   root_device_id |    desc.serial_num | switch_features.n_buffers | switch_features.n_tables |
+------------------+------------------+------------------+--------------------+---------------------------+--------------------------+
| 00010000c0a8461e | 00000000c0a8461e | 0001e3129c807616 | 192.168.70.30:9191 |                       256 |                        2 |
+------------------+------------------+------------------+--------------------+---------------------------+--------------------------+
```
* **id:** Cihazın logical_device id'si
* **datapath_id:** Cihazın datapath_id'si
* **root_device_id:** Cihazın fiziksel device id karşılığı
* **desc.serial_num:** Cihazın SDN kontrolcü tarafından bilinen seri numarası
* **switch_features.n_buffers:** Gelen paketin kontrolcüye hangi boyutlarda gönderileceği bilgisi
* **switch_features.n_tables:** OpenFlow anahtarlayıcının toplam tablo sayısı
