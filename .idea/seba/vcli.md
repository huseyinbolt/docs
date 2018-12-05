#**vCli Kullanma Kılavuzu**
###vCli Erişim
* Username: voltha
* Password: admin
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
###Adaptörlerin Listelenmesi
Komut çıktısında; adaptörün id'sini, geliştirildiği vendorü ve voltha'nın içerisine yüklü olan versiyon numarasını sağlar.ad    ad
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
###Cihazların Listelenmesi
Komut çıktısı:<br/>
* **id:** Cihazız id'si
* **type:** Cihazın kullandığı adaptör
* **root:** ?
* **parent_id:** Cihazın bağlı olduğu bir üst cihazın id'si
* **serial_number:** Cihazın seri numarası
* **admin_state:** Cihazın provizyon durumu **?**
* **oper_status:** Cihazın çalışma durumu
* **connect_status:** Cihazın sisteme bağlı olma durumu
* **parent_port_no:** Bağlı olduğu cihazın bağlı olduğu port numarası
* **host_and_port:** ?
* **reason:** ?
* **proxy_address.device_id:** ?
* **proxy_address.onu_id:** ?
* **proxy_address.onu_session_id:** ?
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
###Cihazın İçerisine Girilmesi
``` devices```  komutu çıktısından içerisine girilmesi istenilen cihazın id'si elde edilir.<br/>
```
(voltha) device [id]
```
komutu ile istenilen cihazın içerisine girilir.
```
(voltha) device 0001e3129c807616
(device 0001e3129c807616) 
```
Cihazın içerisinde yapılabilecek komutlar:
 * ``` ports ``` komutu
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
 * * **admin_state:** Portun provizyon durumu **?**
 * * **oper_status:**  Portun çalışma durumu
 * * **device_id:** Porta sahip olan cihazın id'si