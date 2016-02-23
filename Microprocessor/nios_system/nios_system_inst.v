	nios_system u0 (
		.reset_reset_n                (<connected-to-reset_reset_n>),                //                 reset.reset_n
		.ledr_export                  (<connected-to-ledr_export>),                  //                  ledr.export
		.paralleltoprocessor_export   (<connected-to-paralleltoprocessor_export>),   //   paralleltoprocessor.export
		.clk_clk                      (<connected-to-clk_clk>),                      //                   clk.clk
		.parallelfromprocessor_export (<connected-to-parallelfromprocessor_export>), // parallelfromprocessor.export
		.transmitenable_export        (<connected-to-transmitenable_export>),        //        transmitenable.export
		.charactersent_export         (<connected-to-charactersent_export>),         //         charactersent.export
		.load_export                  (<connected-to-load_export>),                  //                  load.export
		.characterreceived_export     (<connected-to-characterreceived_export>)      //     characterreceived.export
	);

