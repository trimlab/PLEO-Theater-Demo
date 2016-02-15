//
// Very simple main script. Fill in logic in the main function.
//

// save space by packing all strings
#pragma pack 1

//
#include <Log.inc>
#include <Script.inc>


public init()
{
    print("main::init() enter\n");
    log_enable(MSG_ALL);
    log_set_file("log.out");
    print("main::init() exit\n");
}

public main()
{
    print("main::main() enter\n");

    for (;;)
    {
        // give some time back to the firmware
        sleep;
        log_flush();
    }

    // left in, this generates an 'unreachable code' Pawn warning
    //print("main::main() exit\n");
}

public close()
{
    print("main:close() enter\n");
    print("main:close() exit\n");
}
