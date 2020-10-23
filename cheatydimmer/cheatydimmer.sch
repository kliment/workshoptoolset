EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L dimmer-parts:TPS92513 U1
U 1 1 5F6E6765
P 5750 4250
F 0 "U1" H 5750 5381 50  0000 C CNN
F 1 "TPS92512" H 5750 5290 50  0000 C CNN
F 2 "Package_SO:MSOP-10-1EP_3x3mm_P0.5mm_EP1.73x1.98mm_ThermalVias" H 5750 4250 50  0001 C CNN
F 3 "" H 5750 4250 50  0001 C CNN
	1    5750 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5F6E6CF1
P 6300 3700
F 0 "C5" H 6415 3746 50  0000 L CNN
F 1 "100n" H 6415 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6338 3550 50  0001 C CNN
F 3 "~" H 6300 3700 50  0001 C CNN
	1    6300 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5F6E7010
P 6600 3700
F 0 "D1" V 6554 3780 50  0000 L CNN
F 1 "D" V 6645 3780 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 6600 3700 50  0001 C CNN
F 3 "~" H 6600 3700 50  0001 C CNN
	1    6600 3700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F6E741B
P 6600 3850
F 0 "#PWR04" H 6600 3600 50  0001 C CNN
F 1 "GND" H 6605 3677 50  0000 C CNN
F 2 "" H 6600 3850 50  0001 C CNN
F 3 "" H 6600 3850 50  0001 C CNN
	1    6600 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F6E7526
P 5750 4650
F 0 "#PWR05" H 5750 4400 50  0001 C CNN
F 1 "GND" H 5755 4477 50  0000 C CNN
F 2 "" H 5750 4650 50  0001 C CNN
F 3 "" H 5750 4650 50  0001 C CNN
	1    5750 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4650 5750 4650
Connection ~ 5750 4650
Wire Wire Line
	5750 4650 5850 4650
Wire Wire Line
	6150 3800 6150 3850
Wire Wire Line
	6150 3850 6300 3850
Wire Wire Line
	6150 3550 6300 3550
Connection ~ 6300 3550
Wire Wire Line
	6300 3550 6600 3550
$Comp
L Device:L L1
U 1 1 5F6E79D8
P 6750 3550
F 0 "L1" V 6569 3550 50  0000 C CNN
F 1 "L" V 6660 3550 50  0000 C CNN
F 2 "Inductor_SMD:L_Sumida_CDMC6D28_7.25x6.5mm" H 6750 3550 50  0001 C CNN
F 3 "~" H 6750 3550 50  0001 C CNN
	1    6750 3550
	0    1    1    0   
$EndComp
Connection ~ 6600 3550
$Comp
L Device:C C2
U 1 1 5F6E81F6
P 4600 3450
F 0 "C2" H 4715 3496 50  0000 L CNN
F 1 "22u" H 4715 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4638 3300 50  0001 C CNN
F 3 "~" H 4600 3450 50  0001 C CNN
	1    4600 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5F6E8333
P 4800 3450
F 0 "C3" H 4915 3496 50  0000 L CNN
F 1 "22u" H 4915 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4838 3300 50  0001 C CNN
F 3 "~" H 4800 3450 50  0001 C CNN
	1    4800 3450
	1    0    0    -1  
$EndComp
Connection ~ 4600 3300
Wire Wire Line
	4600 3300 4800 3300
Connection ~ 4800 3300
Wire Wire Line
	4800 3300 4900 3300
$Comp
L power:GND #PWR02
U 1 1 5F6E8863
P 4500 3600
F 0 "#PWR02" H 4500 3350 50  0001 C CNN
F 1 "GND" H 4505 3427 50  0000 C CNN
F 2 "" H 4500 3600 50  0001 C CNN
F 3 "" H 4500 3600 50  0001 C CNN
	1    4500 3600
	1    0    0    -1  
$EndComp
Connection ~ 4500 3600
Wire Wire Line
	4500 3600 4600 3600
Connection ~ 4600 3600
Wire Wire Line
	4600 3600 4800 3600
Connection ~ 4900 3300
Wire Wire Line
	4900 3300 5650 3300
$Comp
L Device:R R2
U 1 1 5F6E904E
P 4900 3900
F 0 "R2" H 4970 3946 50  0000 L CNN
F 1 "182k" H 4970 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4830 3900 50  0001 C CNN
F 3 "~" H 4900 3900 50  0001 C CNN
	1    4900 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 3300 4900 3750
Wire Wire Line
	5350 4050 4900 4050
$Comp
L Device:R R3
U 1 1 5F6E97E8
P 4900 4200
F 0 "R3" H 4970 4246 50  0000 L CNN
F 1 "21k" H 4970 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4830 4200 50  0001 C CNN
F 3 "~" H 4900 4200 50  0001 C CNN
	1    4900 4200
	1    0    0    -1  
$EndComp
Connection ~ 4900 4050
Wire Wire Line
	4900 4350 4900 4650
Wire Wire Line
	4900 4650 5050 4650
Connection ~ 5650 4650
$Comp
L Device:R R4
U 1 1 5F6E9C1E
P 5050 4500
F 0 "R4" H 5120 4546 50  0000 L CNN
F 1 "200k" H 5120 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4980 4500 50  0001 C CNN
F 3 "~" H 5050 4500 50  0001 C CNN
	1    5050 4500
	1    0    0    -1  
$EndComp
Connection ~ 5050 4650
Wire Wire Line
	5050 4650 5250 4650
Wire Wire Line
	5350 4150 5050 4150
Wire Wire Line
	5050 4150 5050 4350
$Comp
L Device:C C6
U 1 1 5F6EA347
P 5250 4500
F 0 "C6" H 5365 4546 50  0000 L CNN
F 1 "100n" H 5365 4455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5288 4350 50  0001 C CNN
F 3 "~" H 5250 4500 50  0001 C CNN
	1    5250 4500
	1    0    0    -1  
$EndComp
Connection ~ 5250 4650
Wire Wire Line
	5250 4650 5650 4650
Wire Wire Line
	5350 4250 5250 4250
Wire Wire Line
	5250 4250 5250 4350
$Comp
L Device:R_POT RV1
U 1 1 5F6EAF94
P 5300 2950
F 0 "RV1" V 5093 2950 50  0000 C CNN
F 1 "R_POT" V 5184 2950 50  0000 C CNN
F 2 "corelib:ALPS-RS08U" H 5300 2950 50  0001 C CNN
F 3 "~" H 5300 2950 50  0001 C CNN
	1    5300 2950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F6EB43E
P 5450 2950
F 0 "#PWR01" H 5450 2700 50  0001 C CNN
F 1 "GND" H 5455 2777 50  0000 C CNN
F 2 "" H 5450 2950 50  0001 C CNN
F 3 "" H 5450 2950 50  0001 C CNN
	1    5450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3100 5300 3200
Wire Wire Line
	5300 3650 5350 3650
$Comp
L Device:C C4
U 1 1 5F6EBA70
P 5100 3650
F 0 "C4" H 5215 3696 50  0000 L CNN
F 1 "10n" H 5215 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5138 3500 50  0001 C CNN
F 3 "~" H 5100 3650 50  0001 C CNN
	1    5100 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3500 5300 3500
Connection ~ 5300 3500
Wire Wire Line
	5300 3500 5300 3650
$Comp
L power:GND #PWR03
U 1 1 5F6ECD8F
P 5100 3800
F 0 "#PWR03" H 5100 3550 50  0001 C CNN
F 1 "GND" H 5105 3627 50  0000 C CNN
F 2 "" H 5100 3800 50  0001 C CNN
F 3 "" H 5100 3800 50  0001 C CNN
	1    5100 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack J1
U 1 1 5F6EF913
P 3600 3400
F 0 "J1" H 3657 3725 50  0000 C CNN
F 1 "Barrel_Jack" H 3657 3634 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 3650 3360 50  0001 C CNN
F 3 "~" H 3650 3360 50  0001 C CNN
	1    3600 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 3500 3900 3600
Wire Wire Line
	3900 3600 4000 3600
Wire Wire Line
	3900 3300 4000 3300
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5F6F0E4C
P 4000 3600
F 0 "#FLG0101" H 4000 3675 50  0001 C CNN
F 1 "PWR_FLAG" H 4000 3773 50  0000 C CNN
F 2 "" H 4000 3600 50  0001 C CNN
F 3 "~" H 4000 3600 50  0001 C CNN
	1    4000 3600
	-1   0    0    1   
$EndComp
Connection ~ 4000 3600
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5F6F0FCA
P 4000 3300
F 0 "#FLG0102" H 4000 3375 50  0001 C CNN
F 1 "PWR_FLAG" H 4000 3473 50  0000 C CNN
F 2 "" H 4000 3300 50  0001 C CNN
F 3 "~" H 4000 3300 50  0001 C CNN
	1    4000 3300
	1    0    0    -1  
$EndComp
Connection ~ 4000 3300
Wire Wire Line
	5150 2950 5000 2950
Wire Wire Line
	4000 3300 4100 3300
Wire Wire Line
	4000 3600 4050 3600
$Comp
L Device:C C11
U 1 1 5F6F842C
P 4350 3450
F 0 "C11" H 4465 3496 50  0000 L CNN
F 1 "22u" H 4465 3405 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4388 3300 50  0001 C CNN
F 3 "~" H 4350 3450 50  0001 C CNN
	1    4350 3450
	1    0    0    -1  
$EndComp
Connection ~ 4350 3300
Wire Wire Line
	4350 3300 4600 3300
Connection ~ 4350 3600
Wire Wire Line
	4350 3600 4500 3600
$Comp
L Device:R R13
U 1 1 5F6F862D
P 6800 4300
F 0 "R13" V 6593 4300 50  0000 C CNN
F 1 "1k" V 6684 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6730 4300 50  0001 C CNN
F 3 "~" H 6800 4300 50  0001 C CNN
	1    6800 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	6150 4050 6150 4300
Wire Wire Line
	6150 4300 6650 4300
$Comp
L Device:R R14
U 1 1 5F6F9BF2
P 6950 4450
F 0 "R14" H 6880 4404 50  0000 R CNN
F 1 "0.27R" H 6880 4495 50  0000 R CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 6880 4450 50  0001 C CNN
F 3 "~" H 6950 4450 50  0001 C CNN
	1    6950 4450
	-1   0    0    1   
$EndComp
Connection ~ 6950 4300
$Comp
L power:GND #PWR015
U 1 1 5F6F9E77
P 6950 4600
F 0 "#PWR015" H 6950 4350 50  0001 C CNN
F 1 "GND" H 6955 4427 50  0000 C CNN
F 2 "" H 6950 4600 50  0001 C CNN
F 3 "" H 6950 4600 50  0001 C CNN
	1    6950 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5F6FAC6C
P 7150 3850
F 0 "#PWR014" H 7150 3600 50  0001 C CNN
F 1 "GND" H 7155 3677 50  0000 C CNN
F 2 "" H 7150 3850 50  0001 C CNN
F 3 "" H 7150 3850 50  0001 C CNN
	1    7150 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5F6FB887
P 7800 3650
F 0 "J3" H 7772 3674 50  0000 R CNN
F 1 "Conn_01x03_Male" H 7772 3583 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7800 3650 50  0001 C CNN
F 3 "~" H 7800 3650 50  0001 C CNN
	1    7800 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7600 3650 7450 3650
Wire Wire Line
	7450 3650 7450 3550
Wire Wire Line
	7600 3550 7500 3550
Wire Wire Line
	7500 3550 7500 3750
Wire Wire Line
	7500 3750 7600 3750
Wire Wire Line
	7500 4300 6950 4300
Connection ~ 7500 3750
Wire Wire Line
	7500 3750 7500 4300
$Comp
L Regulator_Linear:L78L05_SOT89 U3
U 1 1 5F70165F
P 4400 2550
F 0 "U3" H 4400 2792 50  0000 C CNN
F 1 "L78L05_SOT89" H 4400 2701 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3" H 4400 2750 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 4400 2500 50  0001 C CNN
	1    4400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2550 4100 3300
Connection ~ 4100 3300
Wire Wire Line
	4100 3300 4350 3300
$Comp
L power:GND #PWR011
U 1 1 5F702DD9
P 4400 2850
F 0 "#PWR011" H 4400 2600 50  0001 C CNN
F 1 "GND" H 4405 2677 50  0000 C CNN
F 2 "" H 4400 2850 50  0001 C CNN
F 3 "" H 4400 2850 50  0001 C CNN
	1    4400 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 5F702FF4
P 4700 2700
F 0 "C9" H 4815 2746 50  0000 L CNN
F 1 "10u" H 4815 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4738 2550 50  0001 C CNN
F 3 "~" H 4700 2700 50  0001 C CNN
	1    4700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2850 4400 2850
Connection ~ 4400 2850
$Comp
L Device:C C12
U 1 1 5F7041ED
P 7150 3700
F 0 "C12" H 7265 3746 50  0000 L CNN
F 1 "10u" H 7265 3655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7188 3550 50  0001 C CNN
F 3 "~" H 7150 3700 50  0001 C CNN
	1    7150 3700
	1    0    0    -1  
$EndComp
Connection ~ 7150 3550
Wire Wire Line
	7150 3550 7450 3550
$Comp
L Device:R R9
U 1 1 5F704793
P 5000 2800
F 0 "R9" H 5070 2846 50  0000 L CNN
F 1 "17.8k" H 5070 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4930 2800 50  0001 C CNN
F 3 "~" H 5000 2800 50  0001 C CNN
	1    5000 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2550 5000 2550
Wire Wire Line
	5000 2550 5000 2650
Connection ~ 4700 2550
$Comp
L Comparator:LMV331 U2
U 1 1 5F705E11
P 6050 2350
F 0 "U2" H 6394 2396 50  0000 L CNN
F 1 "LMV331" H 6394 2305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 6050 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lmv331.pdf" H 6050 2550 50  0001 C CNN
	1    6050 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3200 5550 3200
Wire Wire Line
	5550 3200 5550 2250
Wire Wire Line
	5550 2250 5750 2250
Connection ~ 5300 3200
Wire Wire Line
	5300 3200 5300 3500
$Comp
L power:GND #PWR010
U 1 1 5F707F60
P 5950 2650
F 0 "#PWR010" H 5950 2400 50  0001 C CNN
F 1 "GND" H 5955 2477 50  0000 C CNN
F 2 "" H 5950 2650 50  0001 C CNN
F 3 "" H 5950 2650 50  0001 C CNN
	1    5950 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2050 5250 2050
Wire Wire Line
	5000 2050 5000 2550
Connection ~ 5000 2550
$Comp
L Device:R R5
U 1 1 5F709357
P 5250 2200
F 0 "R5" H 5320 2246 50  0000 L CNN
F 1 "182k" H 5320 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5180 2200 50  0001 C CNN
F 3 "~" H 5250 2200 50  0001 C CNN
	1    5250 2200
	1    0    0    -1  
$EndComp
Connection ~ 5250 2050
Wire Wire Line
	5250 2050 5000 2050
$Comp
L Device:R R7
U 1 1 5F7095DF
P 5250 2500
F 0 "R7" H 5320 2546 50  0000 L CNN
F 1 "4.02k" H 5320 2455 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5180 2500 50  0001 C CNN
F 3 "~" H 5250 2500 50  0001 C CNN
	1    5250 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5F709874
P 5250 2650
F 0 "#PWR09" H 5250 2400 50  0001 C CNN
F 1 "GND" H 5255 2477 50  0000 C CNN
F 2 "" H 5250 2650 50  0001 C CNN
F 3 "" H 5250 2650 50  0001 C CNN
	1    5250 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2450 5450 2450
Wire Wire Line
	5450 2450 5450 2350
Wire Wire Line
	5450 2350 5250 2350
Connection ~ 5250 2350
$Comp
L Device:R R1
U 1 1 5F70AEE8
P 6100 2050
F 0 "R1" V 5893 2050 50  0000 C CNN
F 1 "182k" V 5984 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6030 2050 50  0001 C CNN
F 3 "~" H 6100 2050 50  0001 C CNN
	1    6100 2050
	0    1    1    0   
$EndComp
Connection ~ 5950 2050
Wire Wire Line
	6250 2050 6300 2050
Wire Wire Line
	6350 2050 6350 2350
Text Label 6350 2050 0    50   ~ 0
PDIM
Text Label 5350 3750 3    50   ~ 0
PDIM
$Comp
L dimmer-parts:TPS92513 U4
U 1 1 5F71086D
P 7900 2800
F 0 "U4" H 7900 3931 50  0000 C CNN
F 1 "TPS92512" H 7900 3840 50  0000 C CNN
F 2 "Package_SO:MSOP-10-1EP_3x3mm_P0.5mm_EP1.73x1.98mm_ThermalVias" H 7900 2800 50  0001 C CNN
F 3 "" H 7900 2800 50  0001 C CNN
	1    7900 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5F710877
P 8450 2250
F 0 "C7" H 8565 2296 50  0000 L CNN
F 1 "100n" H 8565 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8488 2100 50  0001 C CNN
F 3 "~" H 8450 2250 50  0001 C CNN
	1    8450 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 5F710881
P 8750 2250
F 0 "D2" V 8704 2330 50  0000 L CNN
F 1 "D" V 8795 2330 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 8750 2250 50  0001 C CNN
F 3 "~" H 8750 2250 50  0001 C CNN
	1    8750 2250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5F71088B
P 8750 2400
F 0 "#PWR07" H 8750 2150 50  0001 C CNN
F 1 "GND" H 8755 2227 50  0000 C CNN
F 2 "" H 8750 2400 50  0001 C CNN
F 3 "" H 8750 2400 50  0001 C CNN
	1    8750 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5F710895
P 7900 3200
F 0 "#PWR013" H 7900 2950 50  0001 C CNN
F 1 "GND" H 7905 3027 50  0000 C CNN
F 2 "" H 7900 3200 50  0001 C CNN
F 3 "" H 7900 3200 50  0001 C CNN
	1    7900 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3200 7900 3200
Connection ~ 7900 3200
Wire Wire Line
	7900 3200 8000 3200
Wire Wire Line
	8300 2350 8300 2400
Wire Wire Line
	8300 2400 8450 2400
Wire Wire Line
	8300 2100 8450 2100
Connection ~ 8450 2100
Wire Wire Line
	8450 2100 8750 2100
$Comp
L Device:L L2
U 1 1 5F7108A7
P 8900 2100
F 0 "L2" V 8719 2100 50  0000 C CNN
F 1 "L" V 8810 2100 50  0000 C CNN
F 2 "Inductor_SMD:L_Sumida_CDMC6D28_7.25x6.5mm" H 8900 2100 50  0001 C CNN
F 3 "~" H 8900 2100 50  0001 C CNN
	1    8900 2100
	0    1    1    0   
$EndComp
Connection ~ 8750 2100
Wire Wire Line
	7500 2600 7050 2600
Connection ~ 7800 3200
$Comp
L Device:R R12
U 1 1 5F7108D6
P 7200 3050
F 0 "R12" H 7270 3096 50  0000 L CNN
F 1 "200k" H 7270 3005 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7130 3050 50  0001 C CNN
F 3 "~" H 7200 3050 50  0001 C CNN
	1    7200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3200 7400 3200
Wire Wire Line
	7500 2700 7200 2700
Wire Wire Line
	7200 2700 7200 2900
$Comp
L Device:C C10
U 1 1 5F7108E4
P 7400 3050
F 0 "C10" H 7515 3096 50  0000 L CNN
F 1 "100n" H 7515 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7438 2900 50  0001 C CNN
F 3 "~" H 7400 3050 50  0001 C CNN
	1    7400 3050
	1    0    0    -1  
$EndComp
Connection ~ 7400 3200
Wire Wire Line
	7400 3200 7800 3200
Wire Wire Line
	7500 2800 7400 2800
Wire Wire Line
	7400 2800 7400 2900
Wire Wire Line
	7450 2200 7500 2200
$Comp
L Device:C C1
U 1 1 5F7108F3
P 7250 2200
F 0 "C1" H 7365 2246 50  0000 L CNN
F 1 "10n" H 7365 2155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7288 2050 50  0001 C CNN
F 3 "~" H 7250 2200 50  0001 C CNN
	1    7250 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2050 7450 2050
Connection ~ 7450 2050
Wire Wire Line
	7450 2050 7450 2200
$Comp
L power:GND #PWR06
U 1 1 5F710900
P 7250 2350
F 0 "#PWR06" H 7250 2100 50  0001 C CNN
F 1 "GND" H 7255 2177 50  0000 C CNN
F 2 "" H 7250 2350 50  0001 C CNN
F 3 "" H 7250 2350 50  0001 C CNN
	1    7250 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5F71090A
P 8950 2850
F 0 "R10" V 8743 2850 50  0000 C CNN
F 1 "1k" V 8834 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8880 2850 50  0001 C CNN
F 3 "~" H 8950 2850 50  0001 C CNN
	1    8950 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 2600 8300 2850
Wire Wire Line
	8300 2850 8800 2850
$Comp
L Device:R R11
U 1 1 5F710918
P 9100 3000
F 0 "R11" H 9030 2954 50  0000 R CNN
F 1 "0.27R" H 9030 3045 50  0000 R CNN
F 2 "Resistor_SMD:R_1210_3225Metric" V 9030 3000 50  0001 C CNN
F 3 "~" H 9100 3000 50  0001 C CNN
	1    9100 3000
	-1   0    0    1   
$EndComp
Connection ~ 9100 2850
$Comp
L power:GND #PWR012
U 1 1 5F710923
P 9100 3150
F 0 "#PWR012" H 9100 2900 50  0001 C CNN
F 1 "GND" H 9105 2977 50  0000 C CNN
F 2 "" H 9100 3150 50  0001 C CNN
F 3 "" H 9100 3150 50  0001 C CNN
	1    9100 3150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5F71092E
P 9300 2400
F 0 "#PWR08" H 9300 2150 50  0001 C CNN
F 1 "GND" H 9305 2227 50  0000 C CNN
F 2 "" H 9300 2400 50  0001 C CNN
F 3 "" H 9300 2400 50  0001 C CNN
	1    9300 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5F710938
P 9950 2200
F 0 "J2" H 9922 2224 50  0000 R CNN
F 1 "Conn_01x03_Male" H 9922 2133 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9950 2200 50  0001 C CNN
F 3 "~" H 9950 2200 50  0001 C CNN
	1    9950 2200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9750 2200 9600 2200
Wire Wire Line
	9600 2200 9600 2100
Wire Wire Line
	9750 2100 9650 2100
Wire Wire Line
	9650 2100 9650 2300
Wire Wire Line
	9650 2300 9750 2300
Wire Wire Line
	9650 2850 9100 2850
Connection ~ 9650 2300
Wire Wire Line
	9650 2300 9650 2850
$Comp
L Device:C C8
U 1 1 5F71094B
P 9300 2250
F 0 "C8" H 9415 2296 50  0000 L CNN
F 1 "10u" H 9415 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9338 2100 50  0001 C CNN
F 3 "~" H 9300 2250 50  0001 C CNN
	1    9300 2250
	1    0    0    -1  
$EndComp
Connection ~ 9300 2100
Wire Wire Line
	9300 2100 9600 2100
Wire Wire Line
	7450 1750 7450 2050
Text Label 7500 2300 3    50   ~ 0
PDIM
Text Label 5550 2850 0    50   ~ 0
ADIM
Text Label 7450 1750 0    50   ~ 0
ADIM
Wire Wire Line
	7800 1850 7050 1850
Text Label 4250 3300 0    50   ~ 0
VIN
Text Label 7050 1850 0    50   ~ 0
VIN
Text Label 7050 2600 2    50   ~ 0
UVLO
Text Label 5350 4050 2    50   ~ 0
UVLO
Wire Wire Line
	6900 3550 7150 3550
Wire Wire Line
	9050 2100 9300 2100
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F7678FE
P 4150 3700
F 0 "H1" H 4050 3657 50  0000 R CNN
F 1 "MountingHole_Pad" H 4050 3748 50  0000 R CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 4150 3700 50  0001 C CNN
F 3 "~" H 4150 3700 50  0001 C CNN
	1    4150 3700
	-1   0    0    1   
$EndComp
Connection ~ 4150 3600
Wire Wire Line
	4150 3600 4350 3600
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F78BDBF
P 4150 3500
F 0 "H2" H 4250 3549 50  0000 L CNN
F 1 "MountingHole_Pad" H 4250 3458 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 4150 3500 50  0001 C CNN
F 3 "~" H 4150 3500 50  0001 C CNN
	1    4150 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5F7C4DF6
P 6300 2050
F 0 "TP1" H 6358 2168 50  0000 L CNN
F 1 "TestPoint" H 6358 2077 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 6500 2050 50  0001 C CNN
F 3 "~" H 6500 2050 50  0001 C CNN
	1    6300 2050
	1    0    0    -1  
$EndComp
Connection ~ 6300 2050
Wire Wire Line
	6300 2050 6350 2050
$Comp
L Connector:TestPoint TP2
U 1 1 5F7C4F3F
P 5550 2250
F 0 "TP2" H 5608 2368 50  0000 L CNN
F 1 "TestPoint" H 5608 2277 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 5750 2250 50  0001 C CNN
F 3 "~" H 5750 2250 50  0001 C CNN
	1    5550 2250
	1    0    0    -1  
$EndComp
Connection ~ 5550 2250
$Comp
L Connector:TestPoint TP3
U 1 1 5F7C5213
P 4050 3600
F 0 "TP3" H 4108 3718 50  0000 L CNN
F 1 "TestPoint" H 4108 3627 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_1.5x1.5mm" H 4250 3600 50  0001 C CNN
F 3 "~" H 4250 3600 50  0001 C CNN
	1    4050 3600
	1    0    0    -1  
$EndComp
Connection ~ 4050 3600
Wire Wire Line
	4050 3600 4150 3600
$EndSCHEMATC