# The platform `conf.mk` file should at least define the default platform flavor
# for the platform, the core configurations (architecture and number of cores),
# the main configuration directives (generic boot, arm trusted firmware support,
# generic time source, console driver, etc...) and some platform default
# configuration settings.

# Default platform flavor
PLATFORM_FLAVOR ?= hikey

include core/arch/arm/cpu/cortex-armv8-0.mk

# Core configuration
$(call force,CFG_TEE_CORE_NB_CORE,8)
# Generic boot
$(call force,CFG_GENERIC_BOOT,y)
$(call force,CFG_PL011,y)
$(call force,CFG_PM_STUBS,y)
# generic time source
$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
# arm TF support
$(call force,CFG_WITH_ARM_TRUSTED_FW,y)
# console driver
$(call force,CFG_8250_UART,y)
CFG_CONSOLE_UART ?= 3
CFG_DRAM_SIZE_GB ?= 2

ta-targets = ta_arm32
ta-targets += ta_arm64

CFG_NUM_THREADS ?= 8
CFG_CRYPTO_WITH_CE ?= y
CFG_WITH_STACK_CANARIES ?= y

CFG_CACHE_API ?= y
CFG_SECURE_DATA_PATH ?= y
CFG_TEE_SDP_MEM_BASE ?= 0x3E800000
CFG_TEE_SDP_MEM_SIZE ?= 0x00400000

CFG_TZDRAM_START ?= 0x3F000000
CFG_TZDRAM_SIZE ?= 0x01000000
CFG_SHMEM_START ?= 0x3EE00000
CFG_SHMEM_SIZE ?= 0x00200000

