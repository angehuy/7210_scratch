set -e
true
true
/Users/ahuynh/miniforge3/envs/7210_test/bin/spades-core /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K21/configs/config.info /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K21/configs/isolate_mode.info
/Users/ahuynh/miniforge3/envs/7210_test/bin/spades-core /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K33/configs/config.info /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K33/configs/isolate_mode.info
/Users/ahuynh/miniforge3/envs/7210_test/bin/spades-core /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K55/configs/config.info /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K55/configs/isolate_mode.info
/Users/ahuynh/miniforge3/envs/7210_test/bin/spades-core /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/configs/config.info /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/configs/isolate_mode.info
/Users/ahuynh/miniforge3/envs/7210_test/bin/python /Users/ahuynh/miniforge3/envs/7210_test/share/spades/spades_pipeline/scripts/copy_files.py /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/before_rr.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/before_rr.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/assembly_graph_after_simplification.gfa /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/assembly_graph_after_simplification.gfa /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/final_contigs.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/contigs.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/first_pe_contigs.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/first_pe_contigs.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/strain_graph.gfa /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/strain_graph.gfa /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/scaffolds.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/scaffolds.fasta /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/scaffolds.paths /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/scaffolds.paths /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/assembly_graph_with_scaffolds.gfa /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/assembly_graph_with_scaffolds.gfa /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/assembly_graph.fastg /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/assembly_graph.fastg /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/K77/final_contigs.paths /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/contigs.paths
true
/Users/ahuynh/miniforge3/envs/7210_test/bin/python /Users/ahuynh/miniforge3/envs/7210_test/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/scaffolds.fasta --misc_dir /Users/ahuynh/Downloads/7210_assignment1/asm/spades/A2128696/misc --threshold_for_breaking_scaffolds 3
true
