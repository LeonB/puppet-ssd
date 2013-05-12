define ssd::noatime(
    $mountpoint = $title,
){

    augeas { 'add_noatime':
        context => '/files/etc/fstab',
        changes => [
            #create node for noatime
            "ins opt after */file[.='/home']/../opt[last()]",

            #set noatime
            "set */file[.='/home']/../opt[last()] noatime"
        ],

        #only run if we don't have 'noatime' already
        onlyif => "match */file[.='/home']/../opt[.='noatime'] size == 0",
    }
}
