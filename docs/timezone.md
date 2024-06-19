# How to set time zone

First, list all available time zones.

```sh
timedatectl list-timezones
```

Then, set your time zone.

```sh
sudo timedatectl set-timezone America/Toronto
```

Finally, verify your time zone is set.

```sh
timedatectl
```
