# TODO move this into btstack
set (src_files 
	btstack/chipset/cc256x/btstack_chipset_cc256x.c

	btstack/platform/freertos/btstack_run_loop_freertos.c
	btstack/platform/freertos/btstack_uart_block_freertos.c

	btstack/src/ad_parser.c
	btstack/src/btstack_linked_list.c
	btstack/src/btstack_memory.c
	btstack/src/btstack_memory_pool.c
	btstack/src/btstack_run_loop.c
	btstack/src/btstack_slip.c
	btstack/src/btstack_tlv.c
	btstack/src/btstack_util.c
	btstack/src/hci.c
	btstack/src/hci_cmd.c
	btstack/src/hci_dump.c
	btstack/src/hci_transport_h4.c
	btstack/src/l2cap.c
	btstack/src/l2cap_signaling.c

	btstack/src/ble/att_db.c
	btstack/src/ble/att_dispatch.c
	btstack/src/ble/att_server.c
	btstack/src/ble/le_device_db_memory.c
	btstack/src/ble/sm.c

	btstack/src/classic/btstack_link_key_db_memory.c
	btstack/src/classic/rfcomm.c
	btstack/src/classic/sdp_server.c
	btstack/src/classic/sdp_util.c
	btstack/src/classic/spp_server.c
)

add_library(btstack STATIC ${src_files})

target_include_directories(btstack PUBLIC 
			   btstack/platform/freertos/ 
			   btstack/chipset/cc256x/ 
			   btstack/platform/embedded/ 
			   btstack/src)

target_link_libraries(btstack drivers_stm32)

