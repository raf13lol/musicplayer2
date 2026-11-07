function file_test_read_permission(fname)
{
    var fid = file_bin_open(fname, 0); // readonly
    if (fid == -1)
        return false;
    return file_bin_close(fid);
}