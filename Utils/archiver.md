# TAR
See more:
- [How to Create Tar Gz File](https://linuxize.com/post/how-to-extract-unzip-tar-gz-file/)
- [How to Extract (Unzip) Tar Gz File](https://linuxize.com/post/how-to-extract-unzip-tar-gz-file/)

The general form of the command for creating tar.gz files is as follows:
```bash
tar -czf archive-name.tar.gz file-name...
```

Here’s what the command options mean:
- c - instructs tar to create a new archive.
- z - sets the compression method to gzip.
- f archive-name.tar.gz - specifies the archive name.
- file-name... a space-separated list of files and directories to be added to the archive.

If you want to create the tar.gz in a specific directory, provide a full path to the archive file:
```bash
tar -czf /home/user/archive.tar.gz file1 file2
```

If you are running a system that has an older version of tar that doesn’t support compression, you can use the gzip command:
```bash
tar -czf - file1 file2 | gzip > archive.tar.gz
```

To extract a tar.gz file, use the `--extract` (`-x`) option and specify the archive file name after the f option:
```bash
tar -xf archive.tar.gz
```

The -v option makes the tar command more visible and prints the names of the files being extracted on the terminal.
```bash
tar -xvf archive.tar.gz
```

Use the --directory (-C) option to specify a directory in which you want to unpack the archive:
```bash
tar -xf archive.tar.gz -C /home/linuxize/files
```

To extract specific files from a tar.gz archive, include a space-separated list of the file names after the archive name:
```bash
tar -xf archive.tar.gz file1 file2
```

To extract one or more directories from an archive, you can follow the same process as extracting individual files:
```bash
tar -xf archive.tar.gz dir1 dir2
```



# RAR

# ZIP

See more:
- [How to zip a folder in Ubuntu Linux / Debian Linux](https://www.cyberciti.biz/faq/how-to-zip-a-folder-in-ubuntu-linux/)
- [zip и unzip](https://metanit.com/os/linux/4.3.php)


To install zip/unzip utility:

```bash
sudo apt install zip unzip
```
