## Prometheus Setup Notes

### 1. What Prometheus does

Prometheus is a monitoring system that collects and stores metrics as
time-series data. It typically **pulls** metrics from endpoints called
exporters.

### 2. Prometheus installation flow

``` text
Download Prometheus
       ↓
Extract it
       ↓
Create prometheus Linux user
       ↓
Create directories
       ↓
Install binaries
       ↓
Install configuration
       ↓
Create systemd service
       ↓
Tell Linux to start Prometheus automatically
       ↓
Start Prometheus
```

### What each step means

1.  **Download Prometheus** --- retrieve the release archive.
2.  **Extract it** --- unpack the archive to access the executable files
    and default configuration.
3.  **Create a Linux service user** --- `prometheus` runs the service
    with limited privileges; it is not intended as a human login
    account.
4.  **Create directories** --- configuration is stored in
    `/etc/prometheus`; time-series data is stored in
    `/var/lib/prometheus`.
5.  **Install binaries** --- place executables such as `prometheus` and
    `promtool` in `/usr/local/bin`.
6.  **Install configuration** --- place `prometheus.yml` under
    `/etc/prometheus`.
7.  **Create a systemd service** --- define how systemd runs Prometheus,
    which user it runs as, and which configuration and data paths it
    uses.
8.  **Enable the service** --- `systemctl enable prometheus` configures
    it to start automatically at boot.
9.  **Start the service** --- `systemctl start prometheus` starts it
    now.

### 3. Important paths and files
 
  `/usr/local/bin/prometheus`                Prometheus executable

  `/usr/local/bin/promtool`                  Tool for checking Prometheus
                                             configuration and rules

  `/etc/prometheus/prometheus.yml`           Main Prometheus configuration

  `/var/lib/prometheus`                      Prometheus time-series database (metrics data)

  `/etc/systemd/system/prometheus.service`   systemd service definition
 

The service user and group are usually named `prometheus`.