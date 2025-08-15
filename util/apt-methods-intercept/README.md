
apt-methods-intercept
=====================

On Ubuntu focal, I discovered a bunch of executable files in
`/usr/lib/apt/methods/`
whose names (`cdrom`, `ftp`, `http`, `https`, `rsh`)
looked a lot like they might be the downloader implementations for apt.
Unfortunately, I couldn't find any documentation about them.
So let's investigate!

1.  I wrote a little [spy script](spy.sh) that dumps all interaction
    between apt and the real downloader.
1.  I renamed the `http` downloader to `http.orig`.
1.  I created a symlink
    `http -> /…$repo_path…/util/apt-methods-intercept/spy.sh`.
1.  I left `https` untouched, because it already was a symlink to `http`.
1.  I created a symlink `https.orig -> http.orig`.
1.  I ran `sudo aptitude update`.
1.  Since there were no pending updates, but I wanted to record a package
    download anyway, I ran `sudo aptitude reinstall pv`.
    (`pv` was the first package I could think of that was both small and
    surely not in use at that moment.)
1.  I looked at the files in `/tmp/apt-intercept`.

:TODO: Report my findings.



