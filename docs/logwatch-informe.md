# LOGWATCH
## Exemple de logwatch
	From hscarlos@localhost.localdomain  Mon May 23 17:08:29 2016
	Return-Path: <hscarlos@localhost.localdomain>
	Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
		by localhost.localdomain (8.14.8/8.14.8) with ESMTP id u4NF8T0C031602
		for <root@localhost.localdomain>; Mon, 23 May 2016 17:08:29 +0200
	Received: (from root@localhost)
		by localhost.localdomain (8.14.8/8.14.8/Submit) id u4NF8RDd031325;
		Mon, 23 May 2016 17:08:27 +0200
	Date: Mon, 23 May 2016 17:08:27 +0200
	Message-Id: <201605231508.u4NF8RDd031325@localhost.localdomain>
	To: root@localhost.localdomain
	From: logwatch@localhost.localdomain
	Subject: Logwatch for fedora (Linux)
	Auto-Submitted: auto-generated
	Precedence: bulk
	MIME-Version: 1.0
	Content-Transfer-Encoding: 7bit
	Content-Type: text/plain; charset="iso-8859-1"

	 
	 ################### Logwatch 7.4.0 (03/01/11) #################### 
			Processing Initiated: Mon May 23 17:08:27 2016
			Date Range Processed: yesterday
								  ( 2016-May-22 )
								  Period is day.
			Detail Level of Output: 10
			Type of Output/Format: mail / text
			Logfiles for Host: fedora
	 ################################################################## 
	 
	 --------------------- afpd Begin ------------------------ 

	 DEBUG: Inside OnlyService for afpd
	 
	 ---------------------- afpd End ------------------------- 

	 
	 --------------------- Arpwatch Begin ------------------------ 

	 DEBUG: Inside OnlyService for arpwatch
	 
	 ---------------------- Arpwatch End ------------------------- 

	 
	 --------------------- Kernel Audit Begin ------------------------ 

	 DEBUG: Inside OnlyService for (kernel:( \[[ 0-9\.]+\])?)?\s*(type=[0-9]+\s*)?audit.*
	 
	 
	 DEBUG: Inside audit filter
	 
	 
	  Number of audit initializations: 1 
	 
	 ---------------------- Kernel Audit End ------------------------- 

	 
	 --------------------- Automount Begin ------------------------ 

	 DEBUG: Inside OnlyService for automount
	 
	 ---------------------- Automount End ------------------------- 

	 
	 --------------------- Clamav Begin ------------------------ 

	 DEBUG: Inside OnlyService for clamd
	 
	 TimeFilter: Period is day
	 
	 TimeFilter: SearchDate is (May 22 ..:..:..)
	 
	 TimeFilter: Debug SearchDate is (May 22 )
	 
	 TimeFilter: Period is day
	 
	 TimeFilter: SearchDate is (2016-05-22T..:..:..\.[0-9]+[+-][0-9]{2}:[0-9]{2})
	 
	 TimeFilter: Debug SearchDate is (2016-05-22T \ [0-9]+[+-][0-9]{2} [0-9]{2})
	 DEBUG: Inside ApplyStdDate...
	 DEBUG: Looking For: (May 22 ..:..:..)
	 DEBUG: Looking For: (2016-05-22T..:..:..\.[0-9]+[+-][0-9]{2}:[0-9]{2})
	 
	 ---------------------- Clamav End ------------------------- 

	 
	 --------------------- Clamav-milter Begin ------------------------ 

	 DEBUG: Inside OnlyService for clamav-milter
	 
	 ---------------------- Clamav-milter End ------------------------- 

	 
	 --------------------- Cron Begin ------------------------ 

	 
	 
	 Commands Run:
		User root:
		   run-parts /etc/cron.hourly: 4 Time(s)
	 
	 ---------------------- Cron End ------------------------- 

	 
	 --------------------- dhcpd Begin ------------------------ 

	 DEBUG: Inside OnlyService for dhcpd
	 
	 ---------------------- dhcpd End ------------------------- 

	 
	 --------------------- ftpd-messages Begin ------------------------ 

	 DEBUG: Inside OnlyService for ftpd
	 
	 ---------------------- ftpd-messages End ------------------------- 

	 
	 --------------------- identd Begin ------------------------ 

	 DEBUG: Inside OnlyService for identd
	 
	 
	 DEBUG: Inside Identd Filter 
	 
	 
	 ---------------------- identd End ------------------------- 

	 
	 --------------------- Init Begin ------------------------ 

	 DEBUG: Inside OnlyService for init
	 
	 ---------------------- Init End ------------------------- 

	 
	 --------------------- ipop3d Begin ------------------------ 

	 DEBUG: Inside OnlyService for ipop3d
	 
	 ---------------------- ipop3d End ------------------------- 

	 
	 --------------------- Kernel Begin ------------------------ 

	 DEBUG: Inside OnlyService for (kernel|sunw,[-\w]+?)
	 
	 WARNING:  Segmentation Faults in these executables
		nautilus :  1 Time(s)
	 
	 WARNING:  Kernel Errors Present
		mce: [Hardware Error]: Machine check  ...:  4 Time(s)
	 
	 1 Time(s): ... bit width:              48
	 1 Time(s): ... event mask:             00000007000000ff
	 1 Time(s): ... fixed-purpose events:   3
	 1 Time(s): ... generic registers:      8
	 1 Time(s): ... max period:             0000ffffffffffff
	 1 Time(s): ... value mask:             0000ffffffffffff
	 1 Time(s): ... version:                3
	 1 Time(s): .... node  #0, CPUs:        #1
	 1 Time(s): ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
	 1 Time(s): ACPI : EC: EC description table is found, configuring boot EC
	 1 Time(s): ACPI : EC: GPE = 0x1b, I/O: command/status = 0x66, data = 0x62
	 1 Time(s): ACPI BIOS Warning (bug): 32/64X FACS address mismatch in FADT: 0xBF7E4E40/0x00000000BF7E4D40, using 32-bit address (20141107/tbfadt-283)
	 1 Time(s): ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S1_] (20141107/hwxface-580)
	 1 Time(s): ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20141107/hwxface-580)
	 1 Time(s): ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000428-0x000000000000042f conflicts with OpRegion 0x0000000000000400-0x000000000000044f (\GPIS) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000428-0x000000000000042f conflicts with OpRegion 0x0000000000000400-0x000000000000047f (\PMIO) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000500-0x000000000000052f conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GP01) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000500-0x000000000000052f conflicts with OpRegion 0x0000000000000500-0x000000000000057f (\GPIO) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000530-0x000000000000053f conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GP01) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000530-0x000000000000053f conflicts with OpRegion 0x0000000000000500-0x000000000000057f (\GPIO) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000540-0x000000000000054f conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GP01) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x0000000000000540-0x000000000000054f conflicts with OpRegion 0x0000000000000500-0x000000000000057f (\GPIO) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x000000000000e000-0x000000000000e01f conflicts with OpRegion 0x000000000000e000-0x000000000000e00f (\SMB0) (20141107/utaddress-258)
	 1 Time(s): ACPI Warning: SystemIO range 0x000000000000e000-0x000000000000e01f conflicts with OpRegion 0x000000000000e000-0x000000000000e00f (\_SB_.PCI0.SBUS.SMBI) (20141107/utaddress-258)
	 1 Time(s): ACPI: (supports S0 S3 S4 S5)
	 1 Time(s): ACPI: AC Adapter [AC0] (on-line)
	 1 Time(s): ACPI: APIC 0x00000000BF7FDF18 0000CC (v02 _ASUS_ Notebook 06222004 MSFT 00010013)
	 1 Time(s): ACPI: ASF! 0x00000000BF7E4A18 0000A0 (v32 INTEL   HCG     00000001 TFSM 000F4240)
	 1 Time(s): ACPI: Added _OSI(3.0 _SCP Extensions)
	 1 Time(s): ACPI: Added _OSI(Module Device)
	 1 Time(s): ACPI: Added _OSI(Processor Aggregator Device)
	 1 Time(s): ACPI: Added _OSI(Processor Device)
	 1 Time(s): ACPI: All ACPI Tables successfully acquired
	 1 Time(s): ACPI: Battery Slot [BAT0] (battery present)
	 1 Time(s): ACPI: Core revision 20141107
	 1 Time(s): ACPI: DBGP 0x00000000BF7FFF18 000034 (v01 _ASUS_ Notebook 06222004 MSFT 00010013)
	 1 Time(s): ACPI: DSDT 0x00000000BF788018 01135A (v01 _ASUS_ Notebook 00000000 INTL 20091112)
	 3 Time(s): ACPI: Dynamic OEM Table Load:
	 1 Time(s): ACPI: ECDT 0x00000000BF7E4B18 0000C1 (v01 _ASUS_ Notebook 06222004 AMI. 00000003)
	 1 Time(s): ACPI: Early table checksum verification disabled
	 1 Time(s): ACPI: Enabled 4 GPEs in block 00 to 3F
	 1 Time(s): ACPI: Executed 1 blocks of module-level executable AML code
	 1 Time(s): ACPI: FACP 0x00000000BF79AD98 0000F4 (v04 _ASUS_ Notebook 06222004 MSFT 00010013)
	 1 Time(s): ACPI: FACS 0x00000000BF7E4E40 000040
	 1 Time(s): ACPI: HPET 0x00000000BF7E5D18 000038 (v01 _ASUS_ Notebook 06222004 AMI. 00000003)
	 1 Time(s): ACPI: HPET id: 0x8086a701 base: 0xfed00000
	 1 Time(s): ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
	 1 Time(s): ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
	 1 Time(s): ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
	 5 Time(s): ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
	 1 Time(s): ACPI: Interpreter enabled
	 1 Time(s): ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] enabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x05] lapic_id[0x04] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x06] lapic_id[0x05] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x07] lapic_id[0x06] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x08] lapic_id[0x07] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x09] lapic_id[0x08] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x0a] lapic_id[0x09] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x0b] lapic_id[0x0a] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x0c] lapic_id[0x0b] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x0d] lapic_id[0x0c] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x0e] lapic_id[0x0d] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x0f] lapic_id[0x0e] disabled)
	 1 Time(s): ACPI: LAPIC (acpi_id[0x10] lapic_id[0x0f] disabled)
	 1 Time(s): ACPI: Lid Switch [LID]
	 3 Time(s): ACPI: Low-level resume complete
	 1 Time(s): ACPI: MCFG 0x00000000BF7E5C98 00003C (v01 _ASUS_ Notebook 06222004 MSFT 00000097)
	 1 Time(s): ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12)
	 1 Time(s): ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *10 12)
	 1 Time(s): ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 *5 6 7 10 12)
	 1 Time(s): ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 *5 6 7 10 12)
	 1 Time(s): ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 12) *0, disabled.
	 1 Time(s): ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 12) *0, disabled.
	 1 Time(s): ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 *5 6 7 10 12)
	 1 Time(s): ACPI: PCI Interrupt Link [LNKH] (IRQs *3 4 5 6 7 10 12)
	 1 Time(s): ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
	 1 Time(s): ACPI: PM-Timer IO Port: 0x408
	 1 Time(s): ACPI: Power Button [PWRF]
	 3 Time(s): ACPI: Preparing to enter system sleep state S3
	 1 Time(s): ACPI: RSDP 0x00000000000F0430 000024 (v02 _ASUS_)
	 1 Time(s): ACPI: SLIC 0x00000000BF79BE18 000176 (v01 _ASUS_ Notebook 06222004 ASUS 00000001)
	 1 Time(s): ACPI: SSDT 0x00000000BF786018 000996 (v01 PmRef  CpuPm    00003000 INTL 20091112)
	 1 Time(s): ACPI: SSDT 0x00000000BF787018 0008D1 (v01 PmRef  Cpu0Ist  00003000 INTL 20091112)
	 1 Time(s): ACPI: SSDT 0xFFFF880139CE4000 00073F (v01 PmRef  Cpu0Cst  00003001 INTL 20091112)
	 1 Time(s): ACPI: SSDT 0xFFFF880139E4FC00 000119 (v01 PmRef  ApCst    00003000 INTL 20091112)
	 1 Time(s): ACPI: SSDT 0xFFFF880139EBB400 000303 (v01 PmRef  ApIst    00003000 INTL 20091112)
	 1 Time(s): ACPI: Sleep Button [SLPB]
	 1 Time(s): ACPI: Thermal Zone [THRM] (71 C)
	 1 Time(s): ACPI: Using IOAPIC for interrupt routing
	 1 Time(s): ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
	 3 Time(s): ACPI: Waking up from system sleep state S3
	 1 Time(s): ACPI: XSDT 0x00000000BF7FEE18 000074 (v01 _ASUS_ Notebook 06222004 MSFT 00010013)
	 1 Time(s): ACPI: bus type PCI registered
	 1 Time(s): ACPI: bus type USB registered
	 1 Time(s): ATOM BIOS: Asus
	 1 Time(s): Adding 4079612k swap on /dev/mapper/fedora-swap.  Priority:-1 extents:1 across:4079612k FS
	 1 Time(s): Adjusting tsc more than 11% (4728230 vs 4666255)
	 1 Time(s): Asymmetric key parser 'x509' registered
	 1 Time(s): BIOS-e820: [mem 0x0000000000000000-0x000000000009e7ff] usable
	 1 Time(s): BIOS-e820: [mem 0x000000000009e800-0x000000000009ffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x0000000000100000-0x000000002004ffff] usable
	 1 Time(s): BIOS-e820: [mem 0x0000000020050000-0x000000002024ffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x0000000020250000-0x000000003fffffff] usable
	 1 Time(s): BIOS-e820: [mem 0x0000000040000000-0x00000000401fffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x0000000040200000-0x00000000bf40bfff] usable
	 1 Time(s): BIOS-e820: [mem 0x00000000bf40c000-0x00000000bf58dfff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000bf58e000-0x00000000bf593fff] usable
	 1 Time(s): BIOS-e820: [mem 0x00000000bf594000-0x00000000bf594fff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000bf595000-0x00000000bf595fff] usable
	 1 Time(s): BIOS-e820: [mem 0x00000000bf596000-0x00000000bf5b7fff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000bf5b8000-0x00000000bf5c5fff] usable
	 1 Time(s): BIOS-e820: [mem 0x00000000bf5c6000-0x00000000bf5e7fff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000bf5e8000-0x00000000bf634fff] usable
	 1 Time(s): BIOS-e820: [mem 0x00000000bf635000-0x00000000bf7e7fff] ACPI NVS
	 1 Time(s): BIOS-e820: [mem 0x00000000bf7e8000-0x00000000bf7fcfff] usable
	 1 Time(s): BIOS-e820: [mem 0x00000000bf7fd000-0x00000000bf7fffff] ACPI data
	 1 Time(s): BIOS-e820: [mem 0x00000000bf800000-0x00000000bfffffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000e0000000-0x00000000e3ffffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000fed10000-0x00000000fed13fff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000fed18000-0x00000000fed19fff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000ff980000-0x00000000ffbfffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x00000000ffd80000-0x00000000ffffffff] reserved
	 1 Time(s): BIOS-e820: [mem 0x0000000100000000-0x000000013f7fffff] usable
	 1 Time(s): Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
	 1 Time(s): Bluetooth: BNEP (Ethernet Emulation) ver 1.3
	 1 Time(s): Bluetooth: BNEP filters: protocol multicast
	 1 Time(s): Bluetooth: BNEP socket layer initialized
	 1 Time(s): Bluetooth: Core ver 2.20
	 1 Time(s): Bluetooth: HCI device and connection manager initialized
	 1 Time(s): Bluetooth: HCI socket layer initialized
	 1 Time(s): Bluetooth: L2CAP socket layer initialized
	 1 Time(s): Bluetooth: SCO socket layer initialized
	 1 Time(s): Booting paravirtualized kernel on bare hardware
	 1 Time(s): Bridge firewalling registered
	 1 Time(s): Broke affinity for irq 17
	 1 Time(s): Broke affinity for irq 29
	 1 Time(s): Built 1 zonelists in Node order, mobility grouping on.  Total pages: 1026152
	 1 Time(s): CPU0: Core temperature above threshold, cpu clock throttled (total events = 1)
	 1 Time(s): CPU0: Core temperature above threshold, cpu clock throttled (total events = 227)
	 2 Time(s): CPU0: Core temperature above threshold, cpu clock throttled (total events = 229)
	 4 Time(s): CPU0: Core temperature/speed normal
	 1 Time(s): CPU0: Package temperature above threshold, cpu clock throttled (total events = 1)
	 1 Time(s): CPU0: Package temperature above threshold, cpu clock throttled (total events = 227)
	 2 Time(s): CPU0: Package temperature above threshold, cpu clock throttled (total events = 229)
	 4 Time(s): CPU0: Package temperature/speed normal
	 1 Time(s): CPU0: Thermal monitoring enabled (TM1)
	 3 Time(s): CPU1 is up
	 1 Time(s): CPU1: Package temperature above threshold, cpu clock throttled (total events = 1)
	 1 Time(s): CPU1: Package temperature above threshold, cpu clock throttled (total events = 227)
	 2 Time(s): CPU1: Package temperature above threshold, cpu clock throttled (total events = 229)
	 4 Time(s): CPU1: Package temperature/speed normal
	 1 Time(s): CPU: Physical Processor ID: 0
	 1 Time(s): CPU: Processor Core ID: 0
	 1 Time(s): Calibrating delay loop (skipped), value calculated using timer frequency.. 3990.80 BogoMIPS (lpj=1995404)
	 1 Time(s): Command line: BOOT_IMAGE=/vmlinuz-3.19.8-100.fc20.x86_64 root=/dev/mapper/fedora-root ro rd.lvm.lv=fedora/swap vconsole.font=latarcyrheb-sun16 rd.lvm.lv=fedora/root rhgb quiet LANG=en_US.UTF-8
	 1 Time(s): Console: colour VGA+ 80x25
	 1 Time(s): Console: switching to colour frame buffer device 170x48
	 1 Time(s): DMA      [mem 0x00001000-0x00ffffff]
	 1 Time(s): DMA32    [mem 0x01000000-0xffffffff]
	 1 Time(s): Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
	 3 Time(s): Disabling non-boot CPUs ...
	 1 Time(s): ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
	 1 Time(s): ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
	 1 Time(s): EXT4-fs (dm-1): mounted filesystem with ordered data mode. Opts: (null)
	 1 Time(s): EXT4-fs (dm-1): re-mounted. Opts: (null)
	 1 Time(s): EXT4-fs (sda6): mounted filesystem with ordered data mode. Opts: (null)
	 1 Time(s): Early memory node ranges
	 1 Time(s): Ebtables v2.0 registered
	 3 Time(s): Enabling non-boot CPUs ...
	 1 Time(s): FAT-fs (sdb1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
	 1 Time(s): Faking a node at [mem 0x0000000000000000-0x000000013f7fffff]
	 1 Time(s): Freeing SMP alternatives memory: 28K (ffffffff81ea1000 - ffffffff81ea8000)
	 1 Time(s): Freeing initrd memory: 19364K (ffff880035a1e000 - ffff880036d07000)
	 1 Time(s): Freeing unused kernel memory: 1504K (ffffffff81d29000 - ffffffff81ea1000)
	 1 Time(s): Freeing unused kernel memory: 596K (ffff88000176b000 - ffff880001800000)
	 1 Time(s): Freeing unused kernel memory: 812K (ffff880001b35000 - ffff880001c00000)
	 3 Time(s): Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
	 3 Time(s): Freezing user space processes ... (elapsed 0.001 seconds) done.
	 1 Time(s): GHES: HEST is not enabled!
	 1 Time(s): Hierarchical RCU implementation.
	 1 Time(s): HugeTLB registered 2 MB page size, pre-allocated 0 pages
	 1 Time(s): IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
	 7 Time(s): IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
	 4 Time(s): IPv6: ADDRCONF(NETDEV_UP): p5p1: link is not ready
	 9 Time(s): IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
	 1 Time(s): Initialise system trusted keyring
	 1 Time(s): Initializing XFRM netlink socket
	 1 Time(s): Initializing cgroup subsys blkio
	 1 Time(s): Initializing cgroup subsys cpu
	 1 Time(s): Initializing cgroup subsys cpuacct
	 1 Time(s): Initializing cgroup subsys cpuset
	 1 Time(s): Initializing cgroup subsys devices
	 1 Time(s): Initializing cgroup subsys freezer
	 1 Time(s): Initializing cgroup subsys hugetlb
	 1 Time(s): Initializing cgroup subsys memory
	 1 Time(s): Initializing cgroup subsys net_cls
	 1 Time(s): Initializing cgroup subsys net_prio
	 1 Time(s): Initializing cgroup subsys perf_event
	 1 Time(s): Initmem setup node 0 [mem 0x00001000-0x13f7fffff]
	 1 Time(s): Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
	 1 Time(s): Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
	 1 Time(s): Intel P-state driver initializing.
	 1 Time(s): Kernel command line: BOOT_IMAGE=/vmlinuz-3.19.8-100.fc20.x86_64 root=/dev/mapper/fedora-root ro rd.lvm.lv=fedora/swap vconsole.font=latarcyrheb-sun16 rd.lvm.lv=fedora/root rhgb quiet LANG=en_US.UTF-8
	 1 Time(s): Key type asymmetric registered
	 1 Time(s): Key type big_key registered
	 1 Time(s): Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
	 1 Time(s): Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
	 1 Time(s): Linux agpgart interface v0.103
	 1 Time(s): Linux version 3.19.8-100.fc20.x86_64 (mockbuild@bkernel01.phx2.fedoraproject.org) (gcc version 4.8.3 20140911 (Red Hat 4.8.3-7) (GCC) ) #1 SMP Tue May 12 17:08:50 UTC 2015
	 1 Time(s): Linux video capture interface: v2.00
	 1 Time(s): Loaded X.509 cert 'Fedora kernel signing key: 06af36eb7b28a5ade90b021e17e6aab2b65263aa'
	 1 Time(s): Loading compiled-in X.509 certificates
	 1 Time(s): Magic number: 0:99:191
	 1 Time(s): Memory: 3999920K/4169856K available (7585K kernel code, 1183K rwdata, 3284K rodata, 1504K init, 1524K bss, 169936K reserved, 0K cma-reserved)
	 1 Time(s): Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
	 1 Time(s): Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
	 1 Time(s): Movable zone start for each node
	 1 Time(s): NET: Registered protocol family 1
	 1 Time(s): NET: Registered protocol family 10
	 1 Time(s): NET: Registered protocol family 16
	 1 Time(s): NET: Registered protocol family 17
	 1 Time(s): NET: Registered protocol family 2
	 1 Time(s): NET: Registered protocol family 31
	 1 Time(s): NET: Registered protocol family 38
	 1 Time(s): NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
	 1 Time(s): NODE_DATA(0) allocated [mem 0x13f7e8000-0x13f7fbfff]
	 1 Time(s): NR_IRQS:65792 nr_irqs:552 16
	 1 Time(s): NX (Execute Disable) protection: active
	 1 Time(s): NetLabel:  domain hash size = 128
	 1 Time(s): NetLabel:  protocols = UNLABELED CIPSOv4
	 1 Time(s): NetLabel:  unlabeled traffic allowed by default
	 1 Time(s): NetLabel: Initializing
	 1 Time(s): No NUMA configuration found
	 1 Time(s): Non-volatile memory driver v1.3
	 1 Time(s): Normal   [mem 0x100000000-0x13f7fffff]
	 1 Time(s): Offload RCU callbacks from CPUs: 0-15.
	 1 Time(s): Offload RCU callbacks from all CPUs
	 1 Time(s): PAT configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- UC  
	 1 Time(s): PCI host bridge to bus 0000:00
	 1 Time(s): PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
	 1 Time(s): PCI: MMCONFIG at [mem 0xe0000000-0xe3ffffff] reserved in E820
	 1 Time(s): PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xe0000000-0xe3ffffff] (base 0xe0000000)
	 1 Time(s): PCI: Using ACPI for IRQ routing
	 1 Time(s): PCI: Using configuration type 1 for base access
	 1 Time(s): PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
	 1 Time(s): PERCPU: Embedded 31 pages/cpu @ffff88013f400000 s86784 r8192 d32000 u131072
	 1 Time(s): PID hash table entries: 4096 (order: 3, 32768 bytes)
	 1 Time(s): PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0x0009e000-0x0009efff]
	 1 Time(s): PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0x20050000-0x2024ffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0x40000000-0x401fffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xbf40c000-0xbf58dfff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xbf594000-0xbf594fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xbf596000-0xbf5b7fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xbf5c6000-0xbf5e7fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xbf635000-0xbf7e7fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xbf7fd000-0xbf7fffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xbf800000-0xbfffffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xc0000000-0xdfffffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xe0000000-0xe3ffffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xe4000000-0xfebfffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfec01000-0xfed0ffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfed10000-0xfed13fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfed14000-0xfed17fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfed18000-0xfed19fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfed1a000-0xfed1bfff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfed20000-0xfedfffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xfee01000-0xff97ffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xff980000-0xffbfffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xffc00000-0xffd7ffff]
	 1 Time(s): PM: Registered nosave memory: [mem 0xffd80000-0xffffffff]
	 1 Time(s): PM: Registering ACPI NVS region [mem 0xbf635000-0xbf7e7fff] (1781760 bytes)
	 3 Time(s): PM: Restoring platform NVS memory
	 3 Time(s): PM: Saving platform NVS memory
	 1 Time(s): PM: Starting manual resume from disk
	 3 Time(s): PM: Syncing filesystems ... done.
	 1 Time(s): PM: early resume of devices complete after 0.238 msecs
	 2 Time(s): PM: early resume of devices complete after 0.498 msecs
	 2 Time(s): PM: late suspend of devices complete after 0.316 msecs
	 1 Time(s): PM: late suspend of devices complete after 0.317 msecs
	 1 Time(s): PM: noirq resume of devices complete after 11.538 msecs
	 2 Time(s): PM: noirq resume of devices complete after 12.521 msecs
	 1 Time(s): PM: noirq suspend of devices complete after 11.621 msecs
	 2 Time(s): PM: noirq suspend of devices complete after 11.625 msecs
	 1 Time(s): PM: resume of devices complete after 1863.145 msecs
	 2 Time(s): PM: resume of devices complete after 1876.489 msecs
	 1 Time(s): PM: suspend of devices complete after 1006.001 msecs
	 2 Time(s): PM: suspend of devices complete after 1389.113 msecs
	 1 Time(s): Performance Events: PEBS fmt1+, 16-deep LBR, SandyBridge events, full-width counters, Intel PMU driver.
	 1 Time(s): Policy zone: Normal
	 1 Time(s): RAMDISK: [mem 0x35a1e000-0x36d06fff]
	 1 Time(s): RAPL PMU detected, hw unit 2^-16 Joules, API unit is 2^-32 Joules, 3 fixed counters 163840 ms ovfl timer
	 1 Time(s): RCU dyntick-idle grace-period acceleration is enabled.
	 1 Time(s): RCU restricting CPUs from NR_CPUS=1024 to nr_cpu_ids=16.
	 1 Time(s): RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
	 1 Time(s): RPC: Registered named UNIX socket transport module.
	 1 Time(s): RPC: Registered tcp NFSv4.1 backchannel transport module.
	 1 Time(s): RPC: Registered tcp transport module.
	 1 Time(s): RPC: Registered udp transport module.
	 1 Time(s): RTC time: 18:10:37, date: 05/21/16
	 3 Time(s): Restarting tasks ... done.
	 1 Time(s): SCSI subsystem initialized
	 1 Time(s): SELinux:  Initializing.
	 1 Time(s): SELinux:  Permission audit_read in class capability2 not defined in policy.
	 1 Time(s): SELinux: the above unknown classes and permissions will be allowed
	 1 Time(s): SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
	 1 Time(s): SMBIOS 2.6 present.
	 1 Time(s): Security Framework initialized
	 1 Time(s): Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
	 3 Time(s): Suspending console(s) (use no_console_suspend to debug)
	 1 Time(s): Switched APIC routing to physical flat.
	 1 Time(s): Switched to clocksource hpet
	 1 Time(s): Switched to clocksource tsc
	 1 Time(s): TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
	 1 Time(s): TCP established hash table entries: 32768 (order: 6, 262144 bytes)
	 1 Time(s): TCP: Hash tables configured (established 32768 bind 32768)
	 1 Time(s): TCP: cubic registered
	 2 Time(s): TCP: lp registered
	 1 Time(s): TCP: reno registered
	 3 Time(s): UDF-fs: INFO Mounting volume 'WTLIB15S', timestamp 2015/11/24 12:29 (1078)
	 1 Time(s): UDP hash table entries: 2048 (order: 4, 65536 bytes)
	 1 Time(s): UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
	 1 Time(s): USB Video Class driver (1.1.1)
	 1 Time(s): Unpacking initramfs...
	 1 Time(s): Using ACPI (MADT) for SMP configuration information
	 1 Time(s): VFS: Disk quotas dquot_6.5.2
	 1 Time(s): VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
	 3 Time(s): VFS: busy inodes on changed media or resized disk sr0
	 1 Time(s): Write protecting the kernel read-only data: 12288k
	 1 Time(s): Zone ranges:
	 1 Time(s): [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
	 1 Time(s): [TTM] Initializing DMA pool allocator
	 1 Time(s): [TTM] Initializing pool allocator
	 1 Time(s): [TTM] Zone  kernel: Available graphics memory: 2011112 kiB
	 1 Time(s): [drm]     CRT1: INTERNAL_KLDSCP_DAC1
	 1 Time(s): [drm]     DFP1: INTERNAL_UNIPHY1
	 1 Time(s): [drm]     LCD1: INTERNAL_UNIPHY
	 1 Time(s): [drm]    pitch is 7680
	 1 Time(s): [drm]   DDC: 0x6440 0x6440 0x6444 0x6444 0x6448 0x6448 0x644c 0x644c
	 1 Time(s): [drm]   DDC: 0x64d8 0x64d8 0x64dc 0x64dc 0x64e0 0x64e0 0x64e4 0x64e4
	 1 Time(s): [drm]   DDC: 0x6560 0x6560 0x6564 0x6564 0x6568 0x6568 0x656c 0x656c
	 3 Time(s): [drm]   Encoders:
	 1 Time(s): [drm]   HDMI-A-1
	 1 Time(s): [drm]   HPD1
	 1 Time(s): [drm]   LVDS-1
	 1 Time(s): [drm]   VGA-1
	 1 Time(s): [drm] Connector 0:
	 1 Time(s): [drm] Connector 1:
	 1 Time(s): [drm] Connector 2:
	 1 Time(s): [drm] Detected VRAM RAM=1024M, BAR=256M
	 1 Time(s): [drm] Driver supports precise vblank timestamp query.
	 1 Time(s): [drm] GART: num cpu pages 262144, num gpu pages 262144
	 1 Time(s): [drm] Initialized drm 1.1.0 20060810
	 1 Time(s): [drm] Initialized radeon 2.40.0 20080528 for 0000:01:00.0 on minor 0
	 1 Time(s): [drm] Internal thermal controller without fan control
	 1 Time(s): [drm] Loading CAICOS Microcode
	 4 Time(s): [drm] PCIE GART of 1024M enabled (table at 0x0000000000274000).
	 1 Time(s): [drm] RAM width 64bits DDR
	 1 Time(s): [drm] Radeon Display Connectors
	 1 Time(s): [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
	 4 Time(s): [drm] UVD initialized successfully.
	 4 Time(s): [drm] enabling PCIE gen 2 link speeds, disable with radeon.pcie_gen2=0
	 1 Time(s): [drm] fb depth is 24
	 1 Time(s): [drm] fb mappable at 0xC0475000
	 4 Time(s): [drm] ib test on ring 0 succeeded in 0 usecs
	 4 Time(s): [drm] ib test on ring 3 succeeded in 0 usecs
	 4 Time(s): [drm] ib test on ring 5 succeeded
	 1 Time(s): [drm] initializing kernel modesetting (CAICOS 0x1002:0x6760 0x1043:0x2002).
	 1 Time(s): [drm] radeon kernel modesetting enabled.
	 1 Time(s): [drm] radeon: 1024M of GTT memory ready.
	 1 Time(s): [drm] radeon: 1024M of VRAM memory ready
	 1 Time(s): [drm] radeon: dpm initialized
	 1 Time(s): [drm] radeon: irq initialized.
	 1 Time(s): [drm] register mmio base: 0xDFE20000
	 1 Time(s): [drm] register mmio size: 131072
	 4 Time(s): [drm] ring test on 0 succeeded in 3 usecs
	 4 Time(s): [drm] ring test on 3 succeeded in 6 usecs
	 4 Time(s): [drm] ring test on 5 succeeded in 2 usecs
	 1 Time(s): [drm] size 8294400
	 1 Time(s): [drm] vram apper at 0xC0000000
	 1 Time(s): acpi PNP0A08:00: Disabling ASPM (FADT indicates it is unsupported)
	 1 Time(s): acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER PCIeCapability]
	 1 Time(s): acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
	 1 Time(s): acpi device:03: registered as cooling_device2
	 1 Time(s): acpi device:1d: hash matches
	 1 Time(s): acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
	 1 Time(s): ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x3 impl SATA mode
	 1 Time(s): ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ems apst 
	 1 Time(s): alg: No test for crc32 (crc32-pclmul)
	 1 Time(s): alg: No test for stdrng (krng)
	 1 Time(s): asus_wmi: ASUS WMI generic driver loaded
	 1 Time(s): asus_wmi: BIOS WMI version: 7.6
	 1 Time(s): asus_wmi: Backlight controlled by ACPI video driver
	 1 Time(s): asus_wmi: Initialization: 0x1
	 1 Time(s): asus_wmi: SFUN value: 0x1a0877
	 1 Time(s): ata1.00: 625142448 sectors, multi 16: LBA48 NCQ (depth 31/32)
	 8 Time(s): ata1.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
	 8 Time(s): ata1.00: ACPI cmd f5/00:00:00:00:00:a0 (SECURITY FREEZE LOCK) filtered out
	 1 Time(s): ata1.00: ATA-8: ST9320325AS, 0003BSM1, max UDMA/133
	 4 Time(s): ata1.00: configured for UDMA/133
	 4 Time(s): ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
	 1 Time(s): ata1: SATA max UDMA/133 abar m2048@0xdff06000 port 0xdff06100 irq 29
	 8 Time(s): ata2.00: ACPI cmd ef/10:03:00:00:00:a0 (SET FEATURES) filtered out
	 1 Time(s): ata2.00: ATAPI: Slimtype DVD A  DS8A8SH, KAA2, max UDMA/100
	 4 Time(s): ata2.00: configured for UDMA/100
	 4 Time(s): ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
	 1 Time(s): ata2: SATA max UDMA/133 abar m2048@0xdff06000 port 0xdff06180 irq 29
	 1 Time(s): ata3: DUMMY
	 1 Time(s): ata4: DUMMY
	 1 Time(s): ata5: DUMMY
	 1 Time(s): ata6: DUMMY
	 1 Time(s): ath9k 0000:03:00.0 wlp3s0: renamed from wlan0
	 1 Time(s): ath: phy0: Enable LNA combining
	 1 Time(s): atl1c 0000:05:00.0 p5p1: renamed from eth0
	 1 Time(s): atl1c 0000:05:00.0: version 1.0.1.1-NAPI
	 1 Time(s): atomic64_test: passed for x86-64 platform with CX8 and with SSE
	 1 Time(s): audit: initializing netlink subsys (disabled)
	 1 Time(s): audit: type=1305 audit(1463847061.121:4): audit_pid=721 old=0 auid=4294967295 ses=4294967295 subj=system_u:system_r:auditd_t:s0 res=1
	 1 Time(s): audit: type=1403 audit(1463854243.809:3): policy loaded auid=4294967295 ses=4294967295
	 1 Time(s): audit: type=1404 audit(1463854243.477:2): enforcing=1 old_enforcing=0 auid=4294967295 ses=4294967295
	 1 Time(s): audit: type=2000 audit(1463854237.719:1): initialized
	 1 Time(s): bridge: automatic filtering via arp/ip/ip6tables has been deprecated. Update your scripts to load br_netfilter if you need this.
	 1 Time(s): cdrom: Uniform CD-ROM driver Revision: 3.20
	 36 Time(s): cfg80211:   (2400000 KHz - 2483500 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
	 18 Time(s): cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
	 18 Time(s): cfg80211:   (2457000 KHz - 2482000 KHz @ 40000 KHz), (N/A, 2000 mBm), (N/A)
	 18 Time(s): cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (N/A, 2000 mBm), (N/A)
	 36 Time(s): cfg80211:   (5150000 KHz - 5250000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2301 mBm), (N/A)
	 18 Time(s): cfg80211:   (5170000 KHz - 5250000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (N/A)
	 18 Time(s): cfg80211:   (5250000 KHz - 5330000 KHz @ 80000 KHz, 160000 KHz AUTO), (N/A, 2000 mBm), (0 s)
	 36 Time(s): cfg80211:   (5250000 KHz - 5350000 KHz @ 80000 KHz, 200000 KHz AUTO), (N/A, 2000 mBm), (0 s)
	 36 Time(s): cfg80211:   (5470000 KHz - 5725000 KHz @ 160000 KHz), (N/A, 2698 mBm), (0 s)
	 18 Time(s): cfg80211:   (5490000 KHz - 5730000 KHz @ 160000 KHz), (N/A, 2000 mBm), (0 s)
	 36 Time(s): cfg80211:   (57000000 KHz - 66000000 KHz @ 2160000 KHz), (N/A, 4000 mBm), (N/A)
	 18 Time(s): cfg80211:   (57240000 KHz - 63720000 KHz @ 2160000 KHz), (N/A, 0 mBm), (N/A)
	 18 Time(s): cfg80211:   (5735000 KHz - 5835000 KHz @ 80000 KHz), (N/A, 2000 mBm), (N/A)
	 54 Time(s): cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
	 54 Time(s): cfg80211:  DFS Master region: unset
	 36 Time(s): cfg80211: Calling CRDA for country: ES
	 19 Time(s): cfg80211: Calling CRDA to update world regulatory domain
	 36 Time(s): cfg80211: Regulatory domain changed to country: ES
	 18 Time(s): cfg80211: World regulatory domain updated:
	 1 Time(s): console [tty0] enabled
	 1 Time(s): cpuidle: using governor menu
	 1 Time(s): device-mapper: ioctl: 4.29.0-ioctl (2014-10-28) initialised: dm-devel@redhat.com
	 1 Time(s): device-mapper: uevent: version 1.0.3
	 1 Time(s): devtmpfs: initialized
	 1 Time(s): drop_monitor: Initializing network drop monitor service
	 1 Time(s): e820: BIOS-provided physical RAM map:
	 1 Time(s): e820: [mem 0xc0000000-0xdfffffff] available for PCI devices
	 1 Time(s): e820: last_pfn = 0x13f800 max_arch_pfn = 0x400000000
	 1 Time(s): e820: last_pfn = 0xbf7fd max_arch_pfn = 0x400000000
	 1 Time(s): ehci-pci 0000:00:1a.0: EHCI Host Controller
	 3 Time(s): ehci-pci 0000:00:1a.0: System wakeup disabled by ACPI
	 3 Time(s): ehci-pci 0000:00:1a.0: System wakeup enabled by ACPI
	 1 Time(s): ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
	 1 Time(s): ehci-pci 0000:00:1a.0: debug port 2
	 1 Time(s): ehci-pci 0000:00:1a.0: irq 16, io mem 0xdff08000
	 1 Time(s): ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 3
	 1 Time(s): ehci-pci 0000:00:1d.0: EHCI Host Controller
	 3 Time(s): ehci-pci 0000:00:1d.0: System wakeup disabled by ACPI
	 3 Time(s): ehci-pci 0000:00:1d.0: System wakeup enabled by ACPI
	 1 Time(s): ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
	 1 Time(s): ehci-pci 0000:00:1d.0: debug port 2
	 1 Time(s): ehci-pci 0000:00:1d.0: irq 23, io mem 0xdff07000
	 1 Time(s): ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 4
	 1 Time(s): ehci-pci: EHCI PCI platform driver
	 1 Time(s): ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
	 1 Time(s): fbcon: radeondrmfb (fb0) is primary device
	 1 Time(s): found SMP MP-table at [mem 0x000fcc80-0x000fcc8f] mapped at [ffff8800000fcc80]
	 1 Time(s): ftrace: allocating 27664 entries in 109 pages
	 1 Time(s): fuse init (API version 7.23)
	 1 Time(s): futex hash table entries: 4096 (order: 6, 262144 bytes)
	 1 Time(s): hid-generic 0003:1B1A:7001.0001: input,hidraw0: USB HID v1.10 Mouse [ USB  Mouse ] on usb-0000:00:1d.0-1.1/input0
	 1 Time(s): hid-generic 0003:1B1A:7001.0002: input,hidraw1: USB HID v1.10 Keyboard [ USB  Mouse ] on usb-0000:00:1d.0-1.1/input1
	 1 Time(s): hidraw: raw HID events driver (C) Jiri Kosina
	 1 Time(s): hpet0: 8 comparators, 64-bit 14.318180 MHz counter
	 1 Time(s): hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
	 1 Time(s): hub 1-0:1.0: 2 ports detected
	 1 Time(s): hub 1-0:1.0: USB hub found
	 1 Time(s): hub 2-0:1.0: 2 ports detected
	 1 Time(s): hub 2-0:1.0: USB hub found
	 1 Time(s): hub 3-0:1.0: 2 ports detected
	 1 Time(s): hub 3-0:1.0: USB hub found
	 1 Time(s): hub 3-1:1.0: 6 ports detected
	 1 Time(s): hub 3-1:1.0: USB hub found
	 1 Time(s): hub 4-0:1.0: 2 ports detected
	 1 Time(s): hub 4-0:1.0: USB hub found
	 1 Time(s): hub 4-1:1.0: 6 ports detected
	 1 Time(s): hub 4-1:1.0: USB hub found
	 1 Time(s): i8042: Detected active multiplexing controller, rev 1.1
	 1 Time(s): i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f03:PS2M] at 0x60,0x64 irq 1,12
	 1 Time(s): iTCO_vendor_support: vendor-support=0
	 1 Time(s): iTCO_wdt: Found a Cougar Point TCO device (Version=2, TCOBASE=0x0460)
	 1 Time(s): iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
	 1 Time(s): iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
	 1 Time(s): ieee80211 phy0: Atheros AR9285 Rev:2 mem=0xffffc90004900000, irq=17
	 1 Time(s): init_memory_mapping: [mem 0x00000000-0x000fffff]
	 1 Time(s): init_memory_mapping: [mem 0x00100000-0x2004ffff]
	 1 Time(s): init_memory_mapping: [mem 0x100000000-0x11fffffff]
	 1 Time(s): init_memory_mapping: [mem 0x120000000-0x13f5fffff]
	 1 Time(s): init_memory_mapping: [mem 0x13f600000-0x13f7fffff]
	 1 Time(s): init_memory_mapping: [mem 0x20250000-0x3fffffff]
	 1 Time(s): init_memory_mapping: [mem 0x40200000-0xbf40bfff]
	 1 Time(s): init_memory_mapping: [mem 0xbf58e000-0xbf593fff]
	 1 Time(s): init_memory_mapping: [mem 0xbf595000-0xbf595fff]
	 1 Time(s): init_memory_mapping: [mem 0xbf5b8000-0xbf5c5fff]
	 1 Time(s): init_memory_mapping: [mem 0xbf5e8000-0xbf634fff]
	 1 Time(s): init_memory_mapping: [mem 0xbf7e8000-0xbf7fcfff]
	 1 Time(s): input:  USB  Mouse  as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.1/4-1.1:1.0/0003:1B1A:7001.0001/input/input12
	 1 Time(s): input:  USB  Mouse  as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.1/4-1.1:1.1/0003:1B1A:7001.0002/input/input13
	 1 Time(s): input: ASUS USB2.0 WebCam as /devices/pci0000:00/0000:00:1a.0/usb3/3-1/3-1.2/3-1.2:1.0/input/input15
	 1 Time(s): input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
	 1 Time(s): input: Asus WMI hotkeys as /devices/platform/asus-nb-wmi/input/input16
	 1 Time(s): input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio4/input/input11
	 1 Time(s): input: HDA ATI HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input17
	 1 Time(s): input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input19
	 1 Time(s): input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input18
	 1 Time(s): input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
	 1 Time(s): input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
	 1 Time(s): input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
	 1 Time(s): input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/input/input14
	 3 Time(s): intel_pstate CPU 1 exiting
	 1 Time(s): intel_rapl: Found RAPL domain core
	 1 Time(s): intel_rapl: Found RAPL domain package
	 1 Time(s): io scheduler cfq registered (default)
	 1 Time(s): io scheduler deadline registered
	 1 Time(s): io scheduler noop registered
	 1 Time(s): ip6_tables: (C) 2000-2006 Netfilter Core Team
	 1 Time(s): ip_tables: (C) 2000-2006 Netfilter Core Team
	 1 Time(s): libphy: Fixed MDIO Bus: probed
	 1 Time(s): loop: module loaded
	 1 Time(s): lpc_ich: Resource conflict(s) found affecting gpio_ich
	 1 Time(s): mce: CPU supports 7 MCE banks
	 1 Time(s): media: Linux media interface: v0.10
	 1 Time(s): microcode: CPU0 sig=0x206a7, pf=0x10, revision=0x23
	 1 Time(s): microcode: CPU1 sig=0x206a7, pf=0x10, revision=0x23
	 1 Time(s): microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
	 1 Time(s): mip6: Mobile IPv6
	 1 Time(s): mousedev: PS/2 mouse device common for all mice
	 1 Time(s): nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
	 1 Time(s): node   0: [mem 0x00001000-0x0009dfff]
	 1 Time(s): node   0: [mem 0x00100000-0x2004ffff]
	 1 Time(s): node   0: [mem 0x100000000-0x13f7fffff]
	 1 Time(s): node   0: [mem 0x20250000-0x3fffffff]
	 1 Time(s): node   0: [mem 0x40200000-0xbf40bfff]
	 1 Time(s): node   0: [mem 0xbf58e000-0xbf593fff]
	 1 Time(s): node   0: [mem 0xbf595000-0xbf595fff]
	 1 Time(s): node   0: [mem 0xbf5b8000-0xbf5c5fff]
	 1 Time(s): node   0: [mem 0xbf5e8000-0xbf634fff]
	 1 Time(s): node   0: [mem 0xbf7e8000-0xbf7fcfff]
	 1 Time(s): ohci-pci: OHCI PCI platform driver
	 1 Time(s): ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
	 1 Time(s): pci 0000:00:01.0:   bridge window [io  0xd000-0xdfff]
	 1 Time(s): pci 0000:00:01.0:   bridge window [mem 0xc0000000-0xcfffffff 64bit pref]
	 1 Time(s): pci 0000:00:01.0:   bridge window [mem 0xdfe00000-0xdfefffff]
	 2 Time(s): pci 0000:00:01.0: PCI bridge to [bus 01]
	 1 Time(s): pci 0000:00:01.0: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:00:1a.0: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:00:1b.0: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:00:1c.0:   bridge window [io  0xc000-0xcfff]
	 1 Time(s): pci 0000:00:1c.0:   bridge window [mem 0xd2200000-0xd2bfffff 64bit pref]
	 1 Time(s): pci 0000:00:1c.0:   bridge window [mem 0xdf400000-0xdfdfffff]
	 2 Time(s): pci 0000:00:1c.0: PCI bridge to [bus 02]
	 1 Time(s): pci 0000:00:1c.0: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:00:1c.1:   bridge window [io  0xb000-0xbfff]
	 1 Time(s): pci 0000:00:1c.1:   bridge window [mem 0xd1700000-0xd20fffff 64bit pref]
	 1 Time(s): pci 0000:00:1c.1:   bridge window [mem 0xdea00000-0xdf3fffff]
	 2 Time(s): pci 0000:00:1c.1: PCI bridge to [bus 03]
	 1 Time(s): pci 0000:00:1c.1: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:00:1c.3:   bridge window [io  0xa000-0xafff]
	 1 Time(s): pci 0000:00:1c.3:   bridge window [mem 0xd0c00000-0xd15fffff 64bit pref]
	 1 Time(s): pci 0000:00:1c.3:   bridge window [mem 0xde000000-0xde9fffff]
	 2 Time(s): pci 0000:00:1c.3: PCI bridge to [bus 04]
	 1 Time(s): pci 0000:00:1c.3: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:00:1c.5:   bridge window [io  0x9000-0x9fff]
	 1 Time(s): pci 0000:00:1c.5:   bridge window [mem 0xd0100000-0xd0afffff 64bit pref]
	 1 Time(s): pci 0000:00:1c.5:   bridge window [mem 0xdd600000-0xddffffff]
	 2 Time(s): pci 0000:00:1c.5: PCI bridge to [bus 05]
	 1 Time(s): pci 0000:00:1c.5: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:00:1d.0: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
	 1 Time(s): pci 0000:01:00.1: Signaling PME through PCIe PME interrupt
	 1 Time(s): pci 0000:03:00.0: Signaling PME through PCIe PME interrupt
	 1 Time(s): pci 0000:03:00.0: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:04:00.0: Signaling PME through PCIe PME interrupt
	 1 Time(s): pci 0000:04:00.0: System wakeup disabled by ACPI
	 1 Time(s): pci 0000:05:00.0: Signaling PME through PCIe PME interrupt
	 1 Time(s): pci 0000:05:00.0: System wakeup disabled by ACPI
	 1 Time(s): pci_bus 0000:00: root bus resource [bus 00-3e]
	 1 Time(s): pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
	 1 Time(s): pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000d3fff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0x000d4000-0x000d7fff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0x000d8000-0x000dbfff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0x000dc000-0x000dffff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0x000e0000-0x000e3fff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0x000e4000-0x000e7fff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfeafffff]
	 1 Time(s): pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed44fff]
	 1 Time(s): pci_hotplug: PCI Hot Plug PCI Core version: 0.5
	 1 Time(s): pciehp: PCI Express Hot Plug Controller Driver version: 0.4
	 1 Time(s): pcieport 0000:00:01.0: Signaling PME through PCIe PME interrupt
	 1 Time(s): pcieport 0000:00:1c.0: Signaling PME through PCIe PME interrupt
	 1 Time(s): pcieport 0000:00:1c.1: Signaling PME through PCIe PME interrupt
	 1 Time(s): pcieport 0000:00:1c.3: Signaling PME through PCIe PME interrupt
	 1 Time(s): pcieport 0000:00:1c.5: Signaling PME through PCIe PME interrupt
	 1 Time(s): perf interrupt took too long (2506 > 2500), lowering kernel.perf_event_max_sample_rate to 50000
	 1 Time(s): perf_event_intel: PEBS disabled due to CPU errata, please upgrade microcode
	 1 Time(s): pid_max: default: 32768 minimum: 301
	 1 Time(s): pinctrl core: initialized pinctrl subsystem
	 1 Time(s): pnp: PnP ACPI init
	 1 Time(s): pnp: PnP ACPI: found 9 devices
	 1 Time(s): process: using mwait in idle threads
	 1 Time(s): psmouse serio4: elantech: Synaptics capabilities query result 0x78, 0x15, 0x0c.
	 1 Time(s): psmouse serio4: elantech: assuming hardware version 3 (with firmware version 0x450f01)
	 1 Time(s): radeon 0000:01:00.0: GTT: 1024M 0x0000000040000000 - 0x000000007FFFFFFF
	 1 Time(s): radeon 0000:01:00.0: VRAM: 1024M 0x0000000000000000 - 0x000000003FFFFFFF (1024M used)
	 4 Time(s): radeon 0000:01:00.0: WB enabled
	 1 Time(s): radeon 0000:01:00.0: fb0: radeondrmfb frame buffer device
	 4 Time(s): radeon 0000:01:00.0: fence driver on ring 0 use gpu addr 0x0000000040000c00 and cpu addr 0xffff88003600bc00
	 4 Time(s): radeon 0000:01:00.0: fence driver on ring 3 use gpu addr 0x0000000040000c0c and cpu addr 0xffff88003600bc0c
	 4 Time(s): radeon 0000:01:00.0: fence driver on ring 5 use gpu addr 0x0000000000072118 and cpu addr 0xffffc90004c32118
	 1 Time(s): radeon 0000:01:00.0: radeon: MSI limited to 32-bit
	 1 Time(s): radeon 0000:01:00.0: radeon: using MSI.
	 1 Time(s): radeon 0000:01:00.0: registered panic notifier
	 1 Time(s): random: nonblocking pool is initialized
	 1 Time(s): random: systemd urandom read with 22 bits of entropy available
	 1 Time(s): registered taskstats version 1
	 1 Time(s): rtc_cmos 00:01: RTC can wake from S4
	 3 Time(s): rtc_cmos 00:01: System wakeup disabled by ACPI
	 1 Time(s): rtc_cmos 00:01: alarms up to one year, y3k, 242 bytes nvram, hpet irqs
	 1 Time(s): rtc_cmos 00:01: rtc core: registered rtc_cmos as rtc0
	 1 Time(s): rtc_cmos 00:01: setting system clock to 2016-05-21 18:10:38 UTC (1463854238)
	 1 Time(s): scsi 0:0:0:0: Direct-Access     ATA      ST9320325AS      BSM1 PQ: 0 ANSI: 5
	 1 Time(s): scsi 1:0:0:0: CD-ROM            Slimtype DVD A  DS8A8SH   KAA2 PQ: 0 ANSI: 5
	 1 Time(s): scsi 6:0:0:0: Direct-Access     SanDisk  Cruzer Blade     1.27 PQ: 0 ANSI: 6
	 1 Time(s): scsi host0: ahci
	 1 Time(s): scsi host1: ahci
	 1 Time(s): scsi host2: ahci
	 1 Time(s): scsi host3: ahci
	 1 Time(s): scsi host4: ahci
	 1 Time(s): scsi host5: ahci
	 1 Time(s): scsi host6: usb-storage 1-1:1.0
	 1 Time(s): sd 0:0:0:0: Attached scsi generic sg0 type 0
	 1 Time(s): sd 0:0:0:0: [sda] 625142448 512-byte logical blocks: (320 GB/298 GiB)
	 1 Time(s): sd 0:0:0:0: [sda] Attached SCSI disk
	 3 Time(s): sd 0:0:0:0: [sda] Starting disk
	 3 Time(s): sd 0:0:0:0: [sda] Stopping disk
	 3 Time(s): sd 0:0:0:0: [sda] Synchronizing SCSI cache
	 1 Time(s): sd 0:0:0:0: [sda] Write Protect is off
	 1 Time(s): sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
	 1 Time(s): sd 6:0:0:0: Attached scsi generic sg2 type 0
	 1 Time(s): sd 6:0:0:0: [sdb] 61056064 512-byte logical blocks: (31.2 GB/29.1 GiB)
	 1 Time(s): sd 6:0:0:0: [sdb] Attached SCSI removable disk
	 1 Time(s): sd 6:0:0:0: [sdb] Write Protect is off
	 1 Time(s): sd 6:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
	 1 Time(s): sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 >
	 1 Time(s): sdb: sdb1
	 1 Time(s): serio: i8042 AUX0 port at 0x60,0x64 irq 12
	 1 Time(s): serio: i8042 AUX1 port at 0x60,0x64 irq 12
	 1 Time(s): serio: i8042 AUX2 port at 0x60,0x64 irq 12
	 1 Time(s): serio: i8042 AUX3 port at 0x60,0x64 irq 12
	 1 Time(s): serio: i8042 KBD port at 0x60,0x64 irq 1
	 1 Time(s): setup_percpu: NR_CPUS:1024 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
	 1 Time(s): shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
	 1 Time(s): smpboot: Allowing 16 CPUs, 14 hotplug CPUs
	 3 Time(s): smpboot: Booting Node 0 Processor 1 APIC 0x2
	 3 Time(s): smpboot: CPU 1 is now offline
	 1 Time(s): smpboot: CPU0: Intel(R) Pentium(R) CPU B940 @ 2.00GHz (fam: 06, model: 2a, stepping: 07)
	 1 Time(s): smpboot: Total of 2 processors activated (7981.61 BogoMIPS)
	 1 Time(s): snd_hda_intel 0000:01:00.1: Handle VGA-switcheroo audio client
	 1 Time(s): software IO TLB [mem 0xbb40c000-0xbf40c000] (64MB) mapped at [ffff8800bb40c000-ffff8800bf40bfff]
	 1 Time(s): sound hdaudioC0D0:      Internal Mic=0x19
	 1 Time(s): sound hdaudioC0D0:      Mic=0x18
	 1 Time(s): sound hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
	 1 Time(s): sound hdaudioC0D0:    inputs:
	 1 Time(s): sound hdaudioC0D0:    mono: mono_out=0x0
	 1 Time(s): sound hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
	 1 Time(s): sound hdaudioC0D0: autoconfig: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
	 1 Time(s): sr 1:0:0:0: Attached scsi generic sg1 type 5
	 1 Time(s): sr 1:0:0:0: [sr0] scsi3-mmc drive: 62x/62x writer dvd-ram cd/rw xa/form2 cdda tray
	 1 Time(s): system 00:00: [io  0x0400-0x0453] could not be reserved
	 1 Time(s): system 00:00: [io  0x0458-0x047f] has been reserved
	 1 Time(s): system 00:00: [io  0x0500-0x057f] has been reserved
	 1 Time(s): system 00:00: [io  0x0680-0x069f] has been reserved
	 1 Time(s): system 00:00: [io  0x1000-0x100f] has been reserved
	 1 Time(s): system 00:00: [io  0x164e-0x164f] has been reserved
	 2 Time(s): system 00:00: [io  0xffff] has been reserved
	 1 Time(s): system 00:02: [io  0x0454-0x0457] has been reserved
	 1 Time(s): system 00:03: [io  0x0240-0x0259] has been reserved
	 1 Time(s): system 00:06: [mem 0xe0000000-0xe3ffffff] has been reserved
	 1 Time(s): system 00:06: [mem 0xfed10000-0xfed17fff] could not be reserved
	 1 Time(s): system 00:06: [mem 0xfed18000-0xfed18fff] has been reserved
	 1 Time(s): system 00:06: [mem 0xfed19000-0xfed19fff] has been reserved
	 1 Time(s): system 00:06: [mem 0xfed1c000-0xfed1ffff] has been reserved
	 1 Time(s): system 00:06: [mem 0xfed20000-0xfed3ffff] has been reserved
	 1 Time(s): system 00:06: [mem 0xfed45000-0xfed8ffff] has been reserved
	 1 Time(s): system 00:06: [mem 0xfed90000-0xfed93fff] has been reserved
	 1 Time(s): system 00:06: [mem 0xfee00000-0xfeefffff] could not be reserved
	 1 Time(s): system 00:06: [mem 0xff000000-0xffffffff] could not be reserved
	 1 Time(s): system 00:07: [mem 0xd2c00000-0xd2c00fff] has been reserved
	 1 Time(s): thermal LNXTHERM:00: registered as thermal_zone0
	 1 Time(s): tsc: Detected 1995.404 MHz processor
	 1 Time(s): tsc: Fast TSC calibration using PIT
	 1 Time(s): tsc: Refined TSC clocksource calibration: 1995.466 MHz
	 1 Time(s): uhci_hcd: USB Universal Host Controller Interface driver
	 1 Time(s): usb 1-1: Manufacturer: SanDisk
	 1 Time(s): usb 1-1: New USB device found, idVendor=0781, idProduct=5567
	 1 Time(s): usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
	 1 Time(s): usb 1-1: Product: Cruzer Blade
	 1 Time(s): usb 1-1: SerialNumber: 4C530001050928108540
	 1 Time(s): usb 1-1: new high-speed USB device number 2 using xhci_hcd
	 3 Time(s): usb 1-1: reset high-speed USB device number 2 using xhci_hcd
	 1 Time(s): usb 3-1.2: Manufacturer: 04G6200086K1AN1B10028N6
	 1 Time(s): usb 3-1.2: New USB device found, idVendor=058f, idProduct=a014
	 1 Time(s): usb 3-1.2: New USB device strings: Mfr=3, Product=1, SerialNumber=0
	 1 Time(s): usb 3-1.2: Product: ASUS USB2.0 WebCam
	 1 Time(s): usb 3-1.2: new high-speed USB device number 3 using ehci-pci
	 3 Time(s): usb 3-1.2: reset high-speed USB device number 3 using ehci-pci
	 1 Time(s): usb 3-1: New USB device found, idVendor=8087, idProduct=0024
	 1 Time(s): usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
	 1 Time(s): usb 3-1: new high-speed USB device number 2 using ehci-pci
	 3 Time(s): usb 3-1: reset high-speed USB device number 2 using ehci-pci
	 1 Time(s): usb 4-1.1: New USB device found, idVendor=1b1a, idProduct=7001
	 1 Time(s): usb 4-1.1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
	 1 Time(s): usb 4-1.1: Product:  USB  Mouse 
	 1 Time(s): usb 4-1.1: new full-speed USB device number 3 using ehci-pci
	 3 Time(s): usb 4-1.1: reset full-speed USB device number 3 using ehci-pci
	 1 Time(s): usb 4-1: New USB device found, idVendor=8087, idProduct=0024
	 1 Time(s): usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
	 1 Time(s): usb 4-1: new high-speed USB device number 2 using ehci-pci
	 3 Time(s): usb 4-1: reset high-speed USB device number 2 using ehci-pci
	 1 Time(s): usb usb1: Manufacturer: Linux 3.19.8-100.fc20.x86_64 xhci-hcd
	 1 Time(s): usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
	 1 Time(s): usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
	 1 Time(s): usb usb1: Product: xHCI Host Controller
	 1 Time(s): usb usb1: SerialNumber: 0000:04:00.0
	 3 Time(s): usb usb1: root hub lost power or was reset
	 1 Time(s): usb usb2: Manufacturer: Linux 3.19.8-100.fc20.x86_64 xhci-hcd
	 1 Time(s): usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
	 1 Time(s): usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
	 1 Time(s): usb usb2: Product: xHCI Host Controller
	 1 Time(s): usb usb2: SerialNumber: 0000:04:00.0
	 3 Time(s): usb usb2: root hub lost power or was reset
	 1 Time(s): usb usb3: Manufacturer: Linux 3.19.8-100.fc20.x86_64 ehci_hcd
	 1 Time(s): usb usb3: New USB device found, idVendor=1d6b, idProduct=0002
	 1 Time(s): usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
	 1 Time(s): usb usb3: Product: EHCI Host Controller
	 1 Time(s): usb usb3: SerialNumber: 0000:00:1a.0
	 3 Time(s): usb usb3: root hub lost power or was reset
	 1 Time(s): usb usb4: Manufacturer: Linux 3.19.8-100.fc20.x86_64 ehci_hcd
	 1 Time(s): usb usb4: New USB device found, idVendor=1d6b, idProduct=0002
	 1 Time(s): usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
	 1 Time(s): usb usb4: Product: EHCI Host Controller
	 1 Time(s): usb usb4: SerialNumber: 0000:00:1d.0
	 3 Time(s): usb usb4: root hub lost power or was reset
	 1 Time(s): usb-storage 1-1:1.0: USB Mass Storage device detected
	 1 Time(s): usbcore: registered new device driver usb
	 1 Time(s): usbcore: registered new interface driver hub
	 1 Time(s): usbcore: registered new interface driver uas
	 1 Time(s): usbcore: registered new interface driver usb-storage
	 1 Time(s): usbcore: registered new interface driver usbfs
	 1 Time(s): usbcore: registered new interface driver usbhid
	 1 Time(s): usbcore: registered new interface driver usbserial
	 1 Time(s): usbcore: registered new interface driver usbserial_generic
	 1 Time(s): usbcore: registered new interface driver uvcvideo
	 1 Time(s): usbhid: USB HID core driver
	 1 Time(s): usbserial: USB Serial support registered for generic
	 1 Time(s): uvcvideo: Found UVC 1.00 device ASUS USB2.0 WebCam (058f:a014)
	 1 Time(s): vboxdrv: TSC mode is 'synchronous', kernel timer mode is 'normal'.
	 1 Time(s): vboxdrv: fAsync=0 offMin=0x1e0 offMax=0xe80
	 1 Time(s): vboxdrv: module verification failed: signature and/or  required key missing - tainting kernel
	 1 Time(s): vboxpci: IOMMU not found (not registered)
	 1 Time(s): vgaarb: bridge control possible 0000:01:00.0
	 1 Time(s): vgaarb: device added: PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
	 1 Time(s): vgaarb: loaded
	 1 Time(s): vgaarb: setting as boot device: PCI:0000:01:00.0
	 3 Time(s): video LNXVIDEO:00: Restoring backlight state
	 18 Time(s): wlp3s0: RX AssocResp from 84:9c:a6:61:21:53 (capab=0x431 status=0 aid=27)
	 22 Time(s): wlp3s0: associate with 84:9c:a6:61:21:53 (try 1/3)
	 4 Time(s): wlp3s0: associate with 84:9c:a6:61:21:53 (try 2/3)
	 4 Time(s): wlp3s0: associate with 84:9c:a6:61:21:53 (try 3/3)
	 18 Time(s): wlp3s0: associated
	 20 Time(s): wlp3s0: associating with AP with corrupt beacon and probe response
	 2 Time(s): wlp3s0: associating with AP with corrupt probe response
	 4 Time(s): wlp3s0: association with 84:9c:a6:61:21:53 timed out
	 22 Time(s): wlp3s0: authenticate with 84:9c:a6:61:21:53
	 22 Time(s): wlp3s0: authenticated
	 6 Time(s): wlp3s0: deauthenticating from 84:9c:a6:61:21:53 by local choice (Reason: 3=DEAUTH_LEAVING)
	 22 Time(s): wlp3s0: send auth to 84:9c:a6:61:21:53 (try 1/3)
	 1 Time(s): wmi: Mapper loaded
	 1 Time(s): x86: Booted up 1 node, 2 CPUs
	 4 Time(s): x86: Booting SMP configuration:
	 3 Time(s): xhci_hcd 0000:04:00.0: System wakeup disabled by ACPI
	 3 Time(s): xhci_hcd 0000:04:00.0: System wakeup enabled by ACPI
	 1 Time(s): xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 1
	 1 Time(s): xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 2
	 2 Time(s): xhci_hcd 0000:04:00.0: xHCI Host Controller
	 3 Time(s): xhci_hcd 0000:04:00.0: xHCI xhci_drop_endpoint called with disabled ep ffff880036850180
	 3 Time(s): xhci_hcd 0000:04:00.0: xHCI xhci_drop_endpoint called with disabled ep ffff8800368501c8
	 1 Time(s): xsave: enabled xstate_bv 0x3, cntxt size 0x240 using standard form
	 1 Time(s): zbud: loaded
	 1 Time(s): zpool: loaded
	 
	 ---------------------- Kernel End ------------------------- 

	 
	 --------------------- LVM Begin ------------------------ 

	 DEBUG: Inside OnlyService for lvm
	 
	 ---------------------- LVM End ------------------------- 

	 
	 --------------------- ModProbe Begin ------------------------ 

	 DEBUG: Inside OnlyService for modprobe
	 
	 ---------------------- ModProbe End ------------------------- 

	 
	 --------------------- Mountd Begin ------------------------ 

	 DEBUG: Inside OnlyService for mountd
	 
	 ---------------------- Mountd End ------------------------- 

	 
	 --------------------- Named Begin ------------------------ 

	 DEBUG: Inside OnlyService for named
	 
	 
	 DEBUG: Inside NAMED Filter 
	 
	 
	 ---------------------- Named End ------------------------- 

	 
	 --------------------- Oidentd Begin ------------------------ 

	 DEBUG: Inside OnlyService for oidentd
	 
	 ---------------------- Oidentd End ------------------------- 

	 
	 --------------------- Dell OMSA Begin ------------------------ 

	 DEBUG: Inside OnlyService for server_administrator
	 
	 ---------------------- Dell OMSA End ------------------------- 

	 
	 --------------------- OpenVPN Begin ------------------------ 

	 DEBUG: Inside OnlyService for openvpn
	 
	 
	 DEBUG 
	 
	 
	 ---------------------- OpenVPN End ------------------------- 

	 
	 --------------------- pam Begin ------------------------ 

	 DEBUG: Inside OnlyService for pam
	 
	 ---------------------- pam End ------------------------- 

	 
	 --------------------- PAM_pwdb Begin ------------------------ 

	 DEBUG: Inside OnlyService for pam_pwdb
	 
	 ---------------------- PAM_pwdb End ------------------------- 

	 
	 --------------------- pam_unix Begin ------------------------ 

	 su-l:
		Sessions Opened:
		   hscarlos -> root: 1 Time(s)
	 
	 sudo:
		Sessions Opened:
		   hscarlos -> root: 2 Time(s)
	 
	 
	 ---------------------- pam_unix End ------------------------- 

	 
	 --------------------- POP-3 Begin ------------------------ 

	 DEBUG: Inside OnlyService for (pop3d-ssl|pop3d|spop3d|tpop3d)
	 
	 
	 DEBUG 
	 
	 
	 ---------------------- POP-3 End ------------------------- 

	 
	 --------------------- PortSentry Begin ------------------------ 

	 DEBUG: Inside OnlyService for portsentry
	 
	 ---------------------- PortSentry End ------------------------- 

	 
	 --------------------- pound Begin ------------------------ 

	 
	 
	 DEBUG: Inside Pound Filter 
	 
	 DEBUG: Inside OnlyService for pound
	 
	 ---------------------- pound End ------------------------- 

	 
	 --------------------- proftpd-messages Begin ------------------------ 

	 DEBUG: Inside OnlyService for proftpd
	 
	 ---------------------- proftpd-messages End ------------------------- 

	 
	 --------------------- Puppet Begin ------------------------ 

	 DEBUG: Inside OnlyService for puppet(d|-agent)
	 
	 ---------------------- Puppet End ------------------------- 

	 
	 --------------------- Raid Begin ------------------------ 

	 DEBUG: Inside OnlyService for kernel
	 
	 ---------------------- Raid End ------------------------- 

	 
	 --------------------- sasl auth daemon Begin ------------------------ 

	 DEBUG: Inside OnlyService for saslauthd\[\d+\]
	 
	 ---------------------- sasl auth daemon End ------------------------- 

	 
	 --------------------- Kernel module scsi Begin ------------------------ 

	 DEBUG: Inside OnlyService for scsi
	 
	 
	 DEBUG: Inside SCSI Filter 
	 
	 
	 ---------------------- Kernel module scsi End ------------------------- 

	 
	 --------------------- Connections (secure-log) Begin ------------------------ 

	 
	 **Unmatched Entries**
		gdm-password]: gkr-pam: unlocked login keyring: 1 Time(s)
		su: pam_ldap(su-l:session): error opening connection to nslcd: No such file or directory: 3 Time(s)
	 
	 ---------------------- Connections (secure-log) End ------------------------- 

	 
	 --------------------- Shaperd Begin ------------------------ 

	 DEBUG: Inside OnlyService for shaperd\d
	 
	 ---------------------- Shaperd End ------------------------- 

	 
	 --------------------- slon Begin ------------------------ 

	 DEBUG: Inside OnlyService for slon
	 
	 
	 DEBUG: Inside SLON Filter 
	 
	 
	 ---------------------- slon End ------------------------- 

	 
	 --------------------- Smartd Begin ------------------------ 

	 DEBUG: Inside OnlyService for smartd
	 
	 ---------------------- Smartd End ------------------------- 

	 
	 --------------------- sonicwall Begin ------------------------ 

	 DEBUG: Inside OnlyService for id=firewall
	 
	 
	 DEBUG: Inside SONICWALL Filter 
	 
	 
	 ---------------------- sonicwall End ------------------------- 

	 
	 --------------------- SSHD Begin ------------------------ 

	 DEBUG: Inside OnlyService for sshd
	 
	 
	 DEBUG: Inside SSHD Filter 
	 
	 
	 ---------------------- SSHD End ------------------------- 

	 
	 --------------------- Sshd2 Begin ------------------------ 

	 DEBUG: Inside OnlyService for sshd2
	 
	 ---------------------- Sshd2 End ------------------------- 

	 
	 --------------------- stunnel Begin ------------------------ 

	 
	 
	 DEBUG: Inside stunnel Filter 
	 
	 DEBUG: Inside OnlyService for stunnel
	 
	 ---------------------- stunnel End ------------------------- 

	 
	 --------------------- Sudo (secure-log) Begin ------------------------ 

	 DEBUG: Inside OnlyService for sudo
	 
	 hscarlos => root
	 ----------------
	 /bin/systemctl start httpd
	 /bin/systemctl stop httpd
	 
	 
	 **Unmatched Entries**
		pam_ldap(sudo:session): error opening connection to nslcd: No such file or directory: 4 Time(s) 
	 ---------------------- Sudo (secure-log) End ------------------------- 

	 
	 --------------------- Syslog-ng Begin ------------------------ 

	 DEBUG: Inside OnlyService for syslog-ng\[[0-9]*\]
	 
	 ---------------------- Syslog-ng End ------------------------- 

	 
	 --------------------- Syslogd Begin ------------------------ 

	 DEBUG: Inside OnlyService for syslogd
	 
	 ---------------------- Syslogd End ------------------------- 

	 
	 --------------------- XNTPD Begin ------------------------ 

	 DEBUG: Inside MultiService for ntpd
	 
	 
	 DEBUG: Exiting XNTPD Filter - no ntpd binary on system
	 
	 
	 ---------------------- XNTPD End ------------------------- 

	 
	 --------------------- yum Begin ------------------------ 

	 
	 
	 DEBUG: Inside YUM Filter 
	 
	 DEBUG(1): Installed: libestr-0.1.9-1.fc20.x86_64
	 DEBUG(2): Installed: rsyslog-7.4.8-2.fc20.x86_64
	 DEBUG(3): Installed: libee-0.4.1-5.fc20.x86_64
	 DEBUG(4): Installed: liblognorm-0.3.7-1.fc20.x86_64
	 DEBUG(5): Installed: libdbi-0.8.4-4.fc20.x86_64
	 DEBUG(6): Installed: hiredis-0.11.0-3.fc20.x86_64
	 DEBUG(7): Installed: librabbitmq-0.4.1-3.fc20.x86_64
	 DEBUG(8): Installed: libnet-1.1.6-7.fc20.x86_64
	 DEBUG(9): Installed: libmongo-client-0.1.6.1-3.fc20.x86_64
	 DEBUG(10): Installed: librelp-1.2.0-1.fc20.x86_64
	 DEBUG(11): Installed: rsyslog-relp-7.4.8-2.fc20.x86_64
	 DEBUG(12): Installed: rsyslog-mongodb-7.4.8-2.fc20.x86_64
	 DEBUG(13): Installed: rsyslog-udpspoof-7.4.8-2.fc20.x86_64
	 DEBUG(14): Installed: rsyslog-rabbitmq-7.4.8-2.fc20.x86_64
	 DEBUG(15): Installed: rsyslog-hiredis-7.4.8-2.fc20.x86_64
	 DEBUG(16): Installed: rsyslog-libdbi-7.4.8-2.fc20.x86_64
	 DEBUG(17): Installed: rsyslog-mmnormalize-7.4.8-2.fc20.x86_64
	 DEBUG(18): Installed: rsyslog-snmp-7.4.8-2.fc20.x86_64
	 DEBUG(19): Installed: rsyslog-pgsql-7.4.8-2.fc20.x86_64
	 DEBUG(20): Installed: rsyslog-mmsnmptrapd-7.4.8-2.fc20.x86_64
	 DEBUG(21): Installed: rsyslog-crypto-7.4.8-2.fc20.x86_64
	 DEBUG(22): Installed: rsyslog-mmjsonparse-7.4.8-2.fc20.x86_64
	 DEBUG(23): Installed: rsyslog-elasticsearch-7.4.8-2.fc20.x86_64
	 DEBUG(24): Installed: rsyslog-gssapi-7.4.8-2.fc20.x86_64
	 DEBUG(25): Installed: rsyslog-gnutls-7.4.8-2.fc20.x86_64
	 DEBUG(26): Installed: rsyslog-mmaudit-7.4.8-2.fc20.x86_64
	 DEBUG(27): Installed: rsyslog-mysql-7.4.8-2.fc20.x86_64
	 DEBUG(28): Installed: rsyslog-doc-7.4.8-2.fc20.x86_64
	 DEBUG(29): Installed: perl-Date-Manip-6.49-1.fc20.noarch
	 DEBUG(30): Installed: perl-Sys-CPU-0.54-5.fc20.x86_64
	 DEBUG(31): Installed: perl-Sys-MemInfo-0.91-8.fc20.x86_64
	 DEBUG(32): Installed: logwatch-7.4.1-2.20140924svn242.fc20.noarch
	 
	 Packages Installed:
		libmongo-client-0.1.6.1-3.fc20.x86_64
		perl-Date-Manip-6.49-1.fc20.noarch
		rsyslog-mmsnmptrapd-7.4.8-2.fc20.x86_64
		rsyslog-mmaudit-7.4.8-2.fc20.x86_64
		librabbitmq-0.4.1-3.fc20.x86_64
		libestr-0.1.9-1.fc20.x86_64
		logwatch-7.4.1-2.20140924svn242.fc20.noarch
		perl-Sys-MemInfo-0.91-8.fc20.x86_64
		rsyslog-elasticsearch-7.4.8-2.fc20.x86_64
		libee-0.4.1-5.fc20.x86_64
		rsyslog-hiredis-7.4.8-2.fc20.x86_64
		perl-Sys-CPU-0.54-5.fc20.x86_64
		liblognorm-0.3.7-1.fc20.x86_64
		rsyslog-gnutls-7.4.8-2.fc20.x86_64
		rsyslog-relp-7.4.8-2.fc20.x86_64
		libdbi-0.8.4-4.fc20.x86_64
		rsyslog-pgsql-7.4.8-2.fc20.x86_64
		libnet-1.1.6-7.fc20.x86_64
		rsyslog-mongodb-7.4.8-2.fc20.x86_64
		librelp-1.2.0-1.fc20.x86_64
		rsyslog-libdbi-7.4.8-2.fc20.x86_64
		rsyslog-crypto-7.4.8-2.fc20.x86_64
		rsyslog-mysql-7.4.8-2.fc20.x86_64
		rsyslog-rabbitmq-7.4.8-2.fc20.x86_64
		hiredis-0.11.0-3.fc20.x86_64
		rsyslog-snmp-7.4.8-2.fc20.x86_64
		rsyslog-7.4.8-2.fc20.x86_64
		rsyslog-mmnormalize-7.4.8-2.fc20.x86_64
		rsyslog-gssapi-7.4.8-2.fc20.x86_64
		rsyslog-mmjsonparse-7.4.8-2.fc20.x86_64
		rsyslog-udpspoof-7.4.8-2.fc20.x86_64
		rsyslog-doc-7.4.8-2.fc20.x86_64
	 
	 ---------------------- yum End ------------------------- 

	 
	 --------------------- Disk Space Begin ------------------------ 

	 
	 
	 DEBUG: Inside zz-disk-space Filter 
	 
	 Filesystem               Size  Used Avail Use% Mounted on
	 devtmpfs                 2.0G     0  2.0G   0% /dev
	 /dev/mapper/fedora-root   45G   24G   18G  58% /
	 /dev/sda6                477M  146M  302M  33% /boot
	 /dev/sda3                105G   82G   23G  79% /run/media/hscarlos/DATA
	 /dev/sdb1                 30G  4.1G   26G  14% /run/media/hscarlos/CHARLY
	 
	 
	 ---------------------- Disk Space End ------------------------- 

	 
	 ###################### Logwatch End ######################### 

