# How to untar a tar file

```
tar xvzf file.tar.gz- to uncompress a gzip tar file (.tgz or .tar.gz)
tar xvjf file.tar.bz2 - to uncompress a bzip2 tar file (.tbz or .tar.bz2) to extract the contents.
tar xvf file.tar - to uncompressed tar file (.tar)
tar xvC /var/tmp -f file.tar - to uncompress tar file (.tar) to another directory

x = eXtract, this indicated an extraction c = create to create )
v = verbose (optional) the files with relative locations will be displayed.
z = gzip-ped; j = bzip2-zipped
f = from/to file ... (what is next after the f is the archive file)
C = directory. In c and r mode, this changes the directory before adding the following files. In x mode, changes directoriy after opening the archive but before extracting entries from the archive.
```

http://how-to.wikia.com/wiki/How_to_untar_a_tar_file_or_gzip-bz2_tar_file
