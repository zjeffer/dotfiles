# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_probe_rs_global_optspecs
        string join \n log-file= log-to-folder r/report= host= token= preset= h/help V/version
end

function __fish_probe_rs_needs_command
        # Figure out if the current invocation already has a command.
        set -l cmd (commandline -opc)
        set -e cmd[1]
        argparse -s (__fish_probe_rs_global_optspecs) -- $cmd 2>/dev/null
        or return
        if set -q argv[1]
                # Also print the command, so this can be used to figure out what it is.
                echo $argv[1]
                return 1
        end
        return 0
end

function __fish_probe_rs_using_subcommand
        set -l cmd (__fish_probe_rs_needs_command)
        test -z "$cmd"
        and return 1
        contains -- $cmd[1] $argv
end

complete -c probe-rs -n "__fish_probe_rs_needs_command" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_needs_command" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_needs_command" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_needs_command" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_needs_command" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_needs_command" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -s V -l version -d 'Print version'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "dap-server" -d 'Debug Adapter Protocol (DAP) server. See <https://probe.rs/docs/tools/debugger/>'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "list" -d 'List all connected debug probes'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "info" -d 'Gets info about the selected debug probe and connected target'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "reset" -d 'Resets the target attached to the selected debug probe'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "gdb" -d 'Run a GDB server'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "debug" -d 'Basic command line debugger'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "download" -d 'Download memory to attached target'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "verify" -d 'Compare memory to attached target'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "erase" -d 'Erase all nonvolatile memory of attached target'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "run" -d 'Flash and run an ELF program'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "attach" -d 'Attach to rtt logging'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "trace" -d 'Trace a memory location on the target'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "itm" -d 'Configure and monitor ITM trace packets from the target'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "chip" -d 'Inspect internal registry of supported chips'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "benchmark" -d 'Measure the throughput of the selected debug probe'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "profile" -d 'Profile on-target runtime performance of target ELF program'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "serve" -d 'Start a server that accepts remote connections'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "read" -d 'Read from target memory address'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "write" -d 'Write to target memory address'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "complete" -d 'Install and complete autocomplete scripts'
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "mi"
complete -c probe-rs -n "__fish_probe_rs_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l port -d 'IP port number to listen for incoming DAP connections, e.g. "50000"' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l ip -d 'IP address to listen for incoming DAP connections, e.g. "127.0.0.1"' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l single-session -d 'Some editors and IDEs expect the debug adapter processes to exit at the end of every debug session (on receiving a `Disconnect` or `Terminate` request)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand dap-server" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand list" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand list" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand list" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand list" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand list" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand list" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l target-sel -d 'SWD Multidrop target selection value' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l core -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand reset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l gdb-connection-string -d 'Use this flag to override the default GDB connection string (localhost:1337).' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l gdb -d 'Spawn gdb after starting the gdbserver.' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l reset-halt -d 'Use this flag to reset and halt (instead of just a halt) the attached core after attaching to the target.'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand gdb" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l core -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l exe -d 'Binary to debug' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l no-catch-reset -d 'Disable reset vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l no-catch-hardfault -d 'Disable hardfault vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand debug" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l flash-layout -d 'Requests the flash builder to output the layout into the given file in SVG format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l binary-format -d 'If a format is provided, use it. If a target has a preferred format, we use that. Finally, if neither of the above cases are true, we default to ELF' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l base-address -d 'The address in memory where the binary will be put at. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l skip -d 'The number of bytes to skip at the start of the binary file. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l idf-bootloader -d 'The idf bootloader path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l idf-partition-table -d 'The idf partition table path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l idf-target-app-partition -d 'The idf target app partition' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l skip-section -d 'Section name to skip flashing. This option may be specified multiple times, and is only considered when `elf` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l disable-progressbars
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l disable-double-buffering -d 'Use this flag to disable double-buffering when downloading flash data. If download fails during programming with timeout errors, try this option'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l restore-unwritten -d 'Enable this flag to restore all bytes erased in the sector erase but not overwritten by any page'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l preverify -d 'Before flashing, read back all the flashed data to skip flashing if the device is up to date'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l verify -d 'After flashing, read back all the flashed data to verify it has been written correctly'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l chip-erase -d 'Whether to erase the entire chip before downloading'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand download" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l binary-format -d 'If a format is provided, use it. If a target has a preferred format, we use that. Finally, if neither of the above cases are true, we default to ELF' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l base-address -d 'The address in memory where the binary will be put at. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l skip -d 'The number of bytes to skip at the start of the binary file. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l idf-bootloader -d 'The idf bootloader path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l idf-partition-table -d 'The idf partition table path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l idf-target-app-partition -d 'The idf target app partition' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l skip-section -d 'Section name to skip flashing. This option may be specified multiple times, and is only considered when `elf` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l disable-progressbars
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand verify" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l disable-progressbars
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand erase" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l format -d 'Configure formatting of the test report output' -r -f -a "pretty\t'One line per test. Output for humans. (default)'
terse\t'One character per test. Usefull for test suites with many tests'
json\t'Json output'"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l skip-test -d 'Skip tests whose names contain FILTER (this flag can be used multiple times)' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -s Z -d 'No-op, ignored. Flag only exists for CLI compatibility with libtest' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l flash-layout -d 'Requests the flash builder to output the layout into the given file in SVG format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l binary-format -d 'If a format is provided, use it. If a target has a preferred format, we use that. Finally, if neither of the above cases are true, we default to ELF' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l base-address -d 'The address in memory where the binary will be put at. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l skip -d 'The number of bytes to skip at the start of the binary file. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l idf-bootloader -d 'The idf bootloader path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l idf-partition-table -d 'The idf partition table path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l idf-target-app-partition -d 'The idf target app partition' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l skip-section -d 'Section name to skip flashing. This option may be specified multiple times, and is only considered when `elf` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l log-format -d 'The format string to use when printing defmt encoded log messages from the target' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l target-output-file -d 'File name to store formatted output at. Different channels can be assigned to different files using channel=file arguments to multiple occurrences (eg. `--target-output-file defmt=out/defmt.txt --target-output-file out/default`). Channel names can be prefixed with `rtt:` or `semihosting:` (eg. `semihosting:stdout`) to disambiguate' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l semihosting-file -d 'File name to expose via semihosting. Values ending with a slash expose the whole directory. By using `target=host` arguments the names can differ between the host and the target. TCP and UNIX domain socket connections are possible by exposing files of the form `tcp:hostname:port` or `unix:/some/path`. `file:/some/path` is valid for files too. If the target path starts with a `^` and ends with a `$` it\'s interpreted as a regular expression and captures are expanded in the host path (e.g. `--semihosting-file "^/(\\d).(\\d)$=/path$1/file$2.txt"`)' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l catch-reset -d 'Deprecated(catch_reset is enabled by default) - Use no_reset_catch to disable this'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l catch-hardfault -d 'Deprecated(catch_hardfault is enabled by default) - Use no_catch_hardfault to disable this'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l no-catch-reset -d 'Disable reset vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l no-catch-hardfault -d 'Disable hardfault vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l list -d 'List all tests instead of executing them'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l exact -d 'If set, filters are matched exactly rather than by substring'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l ignored -d 'If set, run only ignored tests'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l include-ignored -d 'If set, run ignored and non-ignored tests'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l nocapture
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l show-output -d 'No-op, ignored. libtest-mimic does not currently capture stdout'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l disable-progressbars
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l disable-double-buffering -d 'Use this flag to disable double-buffering when downloading flash data. If download fails during programming with timeout errors, try this option'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l restore-unwritten -d 'Enable this flag to restore all bytes erased in the sector erase but not overwritten by any page'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l preverify -d 'Before flashing, read back all the flashed data to skip flashing if the device is up to date'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l verify -d 'After flashing, read back all the flashed data to verify it has been written correctly'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l chip-erase -d 'Whether to erase the entire chip before downloading'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l always-print-stacktrace -d 'Always print the stacktrace on ctrl + c'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l no-location -d 'Suppress filename and line number information from the rtt log'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l no-timestamps -d 'Suppress timestamps from the rtt log'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l rtt-scan-memory -d 'Scan the memory to find the RTT control block'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand run" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l format -d 'Configure formatting of the test report output' -r -f -a "pretty\t'One line per test. Output for humans. (default)'
terse\t'One character per test. Usefull for test suites with many tests'
json\t'Json output'"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l skip-test -d 'Skip tests whose names contain FILTER (this flag can be used multiple times)' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -s Z -d 'No-op, ignored. Flag only exists for CLI compatibility with libtest' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l flash-layout -d 'Requests the flash builder to output the layout into the given file in SVG format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l binary-format -d 'If a format is provided, use it. If a target has a preferred format, we use that. Finally, if neither of the above cases are true, we default to ELF' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l base-address -d 'The address in memory where the binary will be put at. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l skip -d 'The number of bytes to skip at the start of the binary file. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l idf-bootloader -d 'The idf bootloader path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l idf-partition-table -d 'The idf partition table path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l idf-target-app-partition -d 'The idf target app partition' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l skip-section -d 'Section name to skip flashing. This option may be specified multiple times, and is only considered when `elf` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l log-format -d 'The format string to use when printing defmt encoded log messages from the target' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l target-output-file -d 'File name to store formatted output at. Different channels can be assigned to different files using channel=file arguments to multiple occurrences (eg. `--target-output-file defmt=out/defmt.txt --target-output-file out/default`). Channel names can be prefixed with `rtt:` or `semihosting:` (eg. `semihosting:stdout`) to disambiguate' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l semihosting-file -d 'File name to expose via semihosting. Values ending with a slash expose the whole directory. By using `target=host` arguments the names can differ between the host and the target. TCP and UNIX domain socket connections are possible by exposing files of the form `tcp:hostname:port` or `unix:/some/path`. `file:/some/path` is valid for files too. If the target path starts with a `^` and ends with a `$` it\'s interpreted as a regular expression and captures are expanded in the host path (e.g. `--semihosting-file "^/(\\d).(\\d)$=/path$1/file$2.txt"`)' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l catch-reset -d 'Deprecated(catch_reset is enabled by default) - Use no_reset_catch to disable this'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l catch-hardfault -d 'Deprecated(catch_hardfault is enabled by default) - Use no_catch_hardfault to disable this'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l no-catch-reset -d 'Disable reset vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l no-catch-hardfault -d 'Disable hardfault vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l list -d 'List all tests instead of executing them'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l exact -d 'If set, filters are matched exactly rather than by substring'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l ignored -d 'If set, run only ignored tests'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l include-ignored -d 'If set, run ignored and non-ignored tests'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l nocapture
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l show-output -d 'No-op, ignored. libtest-mimic does not currently capture stdout'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l disable-progressbars
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l disable-double-buffering -d 'Use this flag to disable double-buffering when downloading flash data. If download fails during programming with timeout errors, try this option'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l restore-unwritten -d 'Enable this flag to restore all bytes erased in the sector erase but not overwritten by any page'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l preverify -d 'Before flashing, read back all the flashed data to skip flashing if the device is up to date'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l verify -d 'After flashing, read back all the flashed data to verify it has been written correctly'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l chip-erase -d 'Whether to erase the entire chip before downloading'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l always-print-stacktrace -d 'Always print the stacktrace on ctrl + c'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l no-location -d 'Suppress filename and line number information from the rtt log'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l no-timestamps -d 'Suppress timestamps from the rtt log'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l rtt-scan-memory -d 'Scan the memory to find the RTT control block'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand attach" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l core -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand trace" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l core -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -f -a "memory" -d 'Direct ITM data to Embedded Trace Buffer/FIFO (ETB/ETF) for extraction'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -f -a "swo" -d 'Direct ITM traffic out the TRACESWO pin for reception by the probe'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and not __fish_seen_subcommand_from memory swo help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from memory" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from memory" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from memory" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from memory" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from memory" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from memory" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from memory" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from swo" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from swo" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from swo" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from swo" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from swo" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from swo" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from swo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from help" -f -a "memory" -d 'Direct ITM data to Embedded Trace Buffer/FIFO (ETB/ETF) for extraction'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from help" -f -a "swo" -d 'Direct ITM traffic out the TRACESWO pin for reception by the probe'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand itm; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -f -a "list" -d 'Lists all the available families and their chips with their full'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -f -a "info" -d 'Shows chip properties of a specific chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and not __fish_seen_subcommand_from list info help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from list" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from list" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from list" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from list" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from list" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from list" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from info" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from info" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from info" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from info" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from info" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from info" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from help" -f -a "list" -d 'Lists all the available families and their chips with their full'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from help" -f -a "info" -d 'Shows chip properties of a specific chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand chip; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l address -d 'Start address for the benchmark test' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l min-speed -d 'Minimum speed for the debug probe' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l max-speed -d 'Maximum speed for the debug probe' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l word-size -d 'Word size for read/write accesses' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l iterations -d 'Number of times to run each test' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand benchmark" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l format -d 'Configure formatting of the test report output' -r -f -a "pretty\t'One line per test. Output for humans. (default)'
terse\t'One character per test. Usefull for test suites with many tests'
json\t'Json output'"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l skip-test -d 'Skip tests whose names contain FILTER (this flag can be used multiple times)' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -s Z -d 'No-op, ignored. Flag only exists for CLI compatibility with libtest' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l flash-layout -d 'Requests the flash builder to output the layout into the given file in SVG format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l binary-format -d 'If a format is provided, use it. If a target has a preferred format, we use that. Finally, if neither of the above cases are true, we default to ELF' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l base-address -d 'The address in memory where the binary will be put at. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l skip -d 'The number of bytes to skip at the start of the binary file. This is only considered when `bin` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l idf-bootloader -d 'The idf bootloader path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l idf-partition-table -d 'The idf partition table path' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l idf-target-app-partition -d 'The idf target app partition' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l skip-section -d 'Section name to skip flashing. This option may be specified multiple times, and is only considered when `elf` is selected as the format' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l log-format -d 'The format string to use when printing defmt encoded log messages from the target' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l target-output-file -d 'File name to store formatted output at. Different channels can be assigned to different files using channel=file arguments to multiple occurrences (eg. `--target-output-file defmt=out/defmt.txt --target-output-file out/default`). Channel names can be prefixed with `rtt:` or `semihosting:` (eg. `semihosting:stdout`) to disambiguate' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l semihosting-file -d 'File name to expose via semihosting. Values ending with a slash expose the whole directory. By using `target=host` arguments the names can differ between the host and the target. TCP and UNIX domain socket connections are possible by exposing files of the form `tcp:hostname:port` or `unix:/some/path`. `file:/some/path` is valid for files too. If the target path starts with a `^` and ends with a `$` it\'s interpreted as a regular expression and captures are expanded in the host path (e.g. `--semihosting-file "^/(\\d).(\\d)$=/path$1/file$2.txt"`)' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l duration -d 'Duration of profile in seconds' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l core -d 'Which core to profile' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l limit -d 'Limit the number of entries to output' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l catch-reset -d 'Deprecated(catch_reset is enabled by default) - Use no_reset_catch to disable this'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l catch-hardfault -d 'Deprecated(catch_hardfault is enabled by default) - Use no_catch_hardfault to disable this'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l no-catch-reset -d 'Disable reset vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l no-catch-hardfault -d 'Disable hardfault vector catch if its supported on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l list -d 'List all tests instead of executing them'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l exact -d 'If set, filters are matched exactly rather than by substring'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l ignored -d 'If set, run only ignored tests'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l include-ignored -d 'If set, run ignored and non-ignored tests'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l nocapture
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l show-output -d 'No-op, ignored. libtest-mimic does not currently capture stdout'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l disable-progressbars
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l disable-double-buffering -d 'Use this flag to disable double-buffering when downloading flash data. If download fails during programming with timeout errors, try this option'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l restore-unwritten -d 'Enable this flag to restore all bytes erased in the sector erase but not overwritten by any page'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l preverify -d 'Before flashing, read back all the flashed data to skip flashing if the device is up to date'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l verify -d 'After flashing, read back all the flashed data to verify it has been written correctly'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l chip-erase -d 'Whether to erase the entire chip before downloading'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l always-print-stacktrace -d 'Always print the stacktrace on ctrl + c'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l no-location -d 'Suppress filename and line number information from the rtt log'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l no-timestamps -d 'Suppress timestamps from the rtt log'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l rtt-scan-memory -d 'Scan the memory to find the RTT control block'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l flash -d 'Flash the ELF before profiling'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l line-info -d 'Print file and line info for each entry'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -a "naive" -d 'Naive, Halt -> Read PC -> Resume profiler'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -a "itm" -d 'Use the Itm port to profile the chip (ARM only)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -a "pcsr" -d 'Use the DWT_PCSR to profile the chip (ARM only)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and not __fish_seen_subcommand_from naive itm pcsr help" -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from naive" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from naive" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from naive" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from naive" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from naive" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from naive" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from naive" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from itm" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from itm" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from itm" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from itm" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from itm" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from itm" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from itm" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from pcsr" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from pcsr" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from pcsr" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from pcsr" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from pcsr" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from pcsr" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from pcsr" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from help" -f -a "naive" -d 'Naive, Halt -> Read PC -> Resume profiler'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from help" -f -a "itm" -d 'Use the Itm port to profile the chip (ARM only)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from help" -f -a "pcsr" -d 'Use the DWT_PCSR to profile the chip (ARM only)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand profile; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand serve" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand serve" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand serve" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand serve" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand serve" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand serve" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand serve" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l core -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -s o -l output -d 'File to output binary data to' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -s f -l format -d 'Format of the outputted binary data' -r -f -a "hex\t''
binary\t''"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand read" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l core -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l chip -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l chip-description-path -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l protocol -d 'Protocol used to connect to chip. Possible options: [swd, jtag]' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l probe -d 'Use this flag to select a specific probe in the list' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l speed -d 'The protocol speed in kHz' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l non-interactive -d 'Disable interactive probe selection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l connect-under-reset -d 'Use this flag to assert the nreset & ntrst pins during attaching the probe to the chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l dry-run
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l allow-erase-all -d 'Use this flag to allow all memory, including security keys and 3rd party firmware, to be erased even when it has read-only protection'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand write" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -l shell -r -f -a "bash\t''
elvish\t''
fish\t''
powershell\t''
zsh\t''"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -f -a "install" -d 'Installs the autocomplete script for the correct shell'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -f -a "probe-list" -d 'Lists the probes that are currently plugged in in a way that the shell understands'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -f -a "chip-list" -d 'Lists the chips in a way that the shell understands'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and not __fish_seen_subcommand_from install probe-list chip-list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -s m -l manual -d 'Just print the script to stdout if this flag is active'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from probe-list" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from probe-list" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from probe-list" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from probe-list" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from probe-list" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from probe-list" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from probe-list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from chip-list" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from chip-list" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from chip-list" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from chip-list" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from chip-list" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from chip-list" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from chip-list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from help" -f -a "install" -d 'Installs the autocomplete script for the correct shell'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from help" -f -a "probe-list" -d 'Lists the probes that are currently plugged in in a way that the shell understands'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from help" -f -a "chip-list" -d 'Lists the chips in a way that the shell understands'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand complete; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -f -a "meta"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and not __fish_seen_subcommand_from meta help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from meta" -l log-file -d 'Location for log file for probe-rs\'s own debug output' -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from meta" -s r -l report -r -F
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from meta" -l host -d 'Remote host to connect to' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from meta" -l token -d 'Authentication token for remote connections' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from meta" -l preset -d 'A configuration preset to apply' -r
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from meta" -l log-to-folder -d 'Enable logging of probe-rs\'s own debug data to the default folder. This option is ignored if `--log-file` is specified'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from meta" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from help" -f -a "meta"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand mi; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "dap-server" -d 'Debug Adapter Protocol (DAP) server. See <https://probe.rs/docs/tools/debugger/>'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "list" -d 'List all connected debug probes'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "info" -d 'Gets info about the selected debug probe and connected target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "reset" -d 'Resets the target attached to the selected debug probe'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "gdb" -d 'Run a GDB server'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "debug" -d 'Basic command line debugger'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "download" -d 'Download memory to attached target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "verify" -d 'Compare memory to attached target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "erase" -d 'Erase all nonvolatile memory of attached target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "run" -d 'Flash and run an ELF program'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "attach" -d 'Attach to rtt logging'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "trace" -d 'Trace a memory location on the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "itm" -d 'Configure and monitor ITM trace packets from the target'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "chip" -d 'Inspect internal registry of supported chips'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "benchmark" -d 'Measure the throughput of the selected debug probe'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "profile" -d 'Profile on-target runtime performance of target ELF program'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "serve" -d 'Start a server that accepts remote connections'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "read" -d 'Read from target memory address'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "write" -d 'Write to target memory address'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "complete" -d 'Install and complete autocomplete scripts'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "mi"
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and not __fish_seen_subcommand_from dap-server list info reset gdb debug download verify erase run attach trace itm chip benchmark profile serve read write complete mi help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from itm" -f -a "memory" -d 'Direct ITM data to Embedded Trace Buffer/FIFO (ETB/ETF) for extraction'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from itm" -f -a "swo" -d 'Direct ITM traffic out the TRACESWO pin for reception by the probe'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from chip" -f -a "list" -d 'Lists all the available families and their chips with their full'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from chip" -f -a "info" -d 'Shows chip properties of a specific chip'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from profile" -f -a "naive" -d 'Naive, Halt -> Read PC -> Resume profiler'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from profile" -f -a "itm" -d 'Use the Itm port to profile the chip (ARM only)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from profile" -f -a "pcsr" -d 'Use the DWT_PCSR to profile the chip (ARM only)'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from complete" -f -a "install" -d 'Installs the autocomplete script for the correct shell'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from complete" -f -a "probe-list" -d 'Lists the probes that are currently plugged in in a way that the shell understands'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from complete" -f -a "chip-list" -d 'Lists the chips in a way that the shell understands'
complete -c probe-rs -n "__fish_probe_rs_using_subcommand help; and __fish_seen_subcommand_from mi" -f -a "meta"
