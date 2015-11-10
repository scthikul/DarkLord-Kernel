#!/sbin/sh

# Set default governor as interactive @ShinTo
echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo "interactive" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor

# Change interactive sysfs permission @ShinTo
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/timer_rate
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/target_loads
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/boost
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/boostpulse
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/input_boost
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/timer_slack
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/target_loads
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/boost
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/input_boost
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/boostpulse_duration
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor

# Change interactive governor parameters @ShinTo
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
echo 20000 > /sys/devices/system/cpu/cpufreq/interactive/timer_slack
echo 40000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
echo 1190400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
echo 99 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
echo "20000 1400000:80000 1500000:40000 1700000:20000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
echo "85 1400000:90 1700000:95" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
echo 100000 > /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor

# Set default min freg @ShinTo
echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq