{ inputs, config, lib, pkgs, ... }: {

	options.modules.btop.enable = lib.mkEnableOption "btop";

	config = lib.mkIf config.modules.btop.enable (
        let 
            c = "#${config.modules.theme.color.violet}";
        in
        {
            programs.btop = {
                enable = true;
        
                settings = {
        
                    #color_theme = “btop-theme”; #../share/btop/themes/btop-theme.theme
        
                    theme_background = true;
                    truecolor = true;
                    force_tty = false;
                    #presets = “...”;
                    vim_keys = false;
                    rounded_corners = true;
                    terminal_sync = true;
        
                    graph_symbol = "braille";
                    graph_symbol_cpu = "default";
                    graph_symbol_mem = "default";
                    graph_symbol_net = "default";
                    graph_symbol_proc = "default";
        
                    show_boxes = "cpu mem net proc gpu0 gpu1";
                    update_ms = 2000;
        
                    proc_sorting = "cpu lazy";
                    proc_reversed = false;
                    proc_tree = false;
                    proc_colors = true;
                    proc_gradient = true;
                    proc_per_core = false;
                    proc_mem_bytes = true;
                    proc_cpu_graphs = true;
                    proc_info_smaps = false;
                    proc_left = false;
                    proc_filter_kernel = false;
                    proc_follow_detailed = true;
                    proc_aggregate = false;
                    keep_dead_proc_usage = false;
        
                    cpu_graph_upper = "Auto";
                    cpu_graph_lower = "Auto";
                    cpu_invert_lower = true;
                    cpu_single_graph = false;
                    cpu_bottom = false;
                    show_uptime = true;
                    show_cpu_watts = true;
                    check_temp = true;
                    cpu_sensor = "Auto";
                    show_cpu_freq = true;
                    freq_mode = "first";
                    show_coretemp = true;
                    #cpu_core_map = "";
                    #custom_cpu_name = "";
        
                    temp_scale = "celsius";
                    base_10_sizes = false;
                    #clock_format = "%X";
                    background_update = true;
        
                    #disks_filter = "";
                    show_disks = true;
                    only_physical = true;
                    use_fstab = false;
                    disk_free_priv = false;
                    show_io_stat = true;
                    io_mode = false;
                    io_graph_combined = false;
                    #io_graph_speeds = "";
                    zfs_arc_cached = true;
                    zfs_hide_datasets = false;
                                
                    mem_graphs = true;
                    mem_below_net = false;
                    show_swap = true;
                    swap_disk = false;
        
                    net_download = 100;
                    net_upload = 100;
                    net_auto = true; # Overrides net_download and net_upload
                    net_sync = true;
                    #net_iface = "";
                    base_10_bitrate = "Auto"; # “Auto” uses base_10_sizes
        
                    show_battery = true;
                    selected_battery = "Auto";
                    show_battery_watts = true;
        
                    log_level = "WARNING";
        
                };
        
                themes = {
                    btop-theme = ''
                        theme[main_bg]="#282a36"
                        theme[main_fg]="#f8f8f2"
                        theme[title]="#f8f8f2"
                        theme[hi_fg]="#6272a4"
                        theme[selected_bg]="#ff79c6"
                        theme[selected_fg]="#f8f8f2"
                        theme[inactive_fg]="#44475a"
                        theme[graph_text]="#f8f8f2"
                        theme[meter_bg]="#44475a"
                        theme[proc_misc]="#bd93f9"
                        theme[cpu_box]="#bd93f9"
                        theme[mem_box]="#50fa7b"
                        theme[net_box]="#ff5555"
                        theme[proc_box]="#8be9fd"
                        theme[div_line]="#44475a"
                        theme[temp_start]="#bd93f9"
                        theme[temp_mid]="#ff79c6"
                        theme[temp_end]="#ff33a8"
                        theme[cpu_start]="#bd93f9"
                        theme[cpu_mid]="#8be9fd"
                        theme[cpu_end]="#50fa7b"
                        theme[free_start]="#ffa6d9"
                        theme[free_mid]="#ff79c6"
                        theme[free_end]="#ff33a8"
                        theme[cached_start]="#b1f0fd"
                        theme[cached_mid]="#8be9fd"
                        theme[cached_end]="#26d7fd"
                        theme[available_start]="#ffd4a6"
                        theme[available_mid]="#ffb86c"
                        theme[available_end]="#ff9c33"
                        theme[used_start]="#96faaf"
                        theme[used_mid]="#50fa7b"
                        theme[used_end]="#0dfa49"
                        theme[download_start]="#bd93f9"
                        theme[download_mid]="#50fa7b"
                        theme[download_end]="#8be9fd"
                        theme[upload_start]="#8c42ab"
                        theme[upload_mid]="#ff79c6"
                        theme[upload_end]="#ff33a8"
                        theme[process_start]="#50fa7b"
                        theme[process_mid]="#59b690"
                        theme[process_end]="#6272a4"
                    '';
                };
            };
        }
		
	);
}
