# Project-1 : System Monitor

A real-time Linux system monitor written in Bash that tracks CPU, Memory, and Disk usage with visual progress bars and configurable alerts.

## Features
- Real-time CPU usage monitoring
- Real-time Memory usage monitoring
- Real-time Disk usage monitoring
- Visual progress bar for each metric
- Configurable threshold alerts
- Continuous monitoring with automatic refresh

## Requirements
- Linux operating system
- Bash shell
- Standard Linux commands: `top`, `free`, `df`

## Installation
```
git clone https://github.com/0x9z/system-monitor.git
cd system-monitor
chmod +x system-monitor.sh
```

=================================================

1) Usage
```
./system-monitor.sh
```
Press Ctrl + C to stop.


2) Configuration

Edit the threshold values at the top of the script:

```
cpu_var=80   # Alert when CPU exceeds 80%
mem_var=80   # Alert when Memory exceeds 80%
disk_var=80  # Alert when Disk exceeds 80%
```


3) Example Output

```
====================System Monitoring Tool=================

Real time CPU usage     : [XXXXXXXX........................]  21%
Real time MEMORY usage  : [XXXXXXXXXXXXXXXX................]  42%
Real time DISK usage    : [XXX.............................]   8%

===========================================================
```

4) How It Works

    CPU: Extracts idle percentage from top and calculates used percentage

    Memory: Reads used and total memory from free and calculates percentage

    Disk: Gets used percentage from df for the root partition

    Alerts: Compares each value against thresholds and displays warnings

    Progress bars: Dynamically generates visual bars based on percentage values


5) Future Improvements

   > Email notifications for alerts

   > Logging to a file

   > Support for custom disk partitions

   > Network usage monitoring

License

MIT

Author
@0x9z

