Getting Started
===============

To begin, download the PLEO RB SDK from
<http://www.pleoworld.com/pleo_rb/eng/pdk.php>. Use the included batch
files for building and re-building the script. Warning: **do not**
download the SDK from <http://www.pleoworld.com/eng/pdk.php> - this is
an out-of date version with incorrect documentation and incomplete
methods. You want version 1.2 of the SDK, not version 1.1.

Template
--------

Next, download the PLEO template from [TBD](TBD). The template contains
the directory structure and files needed for a basic PLEO script, as
well as some basic functionality. This functionality includes:

-   Debug output logging to the SD card.

-   Warning tones if PLEO RB’s limbs are moved by hand.

-   Working power button. While PLEO is running, press the power button
    to reset his limbs and power him off. DO NOT EDIT THIS CODE.

Building Scripts
----------------

To build the template script, double click on *build.bat*. Navigate to
the *build* directory, and copy the *.urf* file to the root directory of
your MicroSD card. When you insert the MicroSD card into PLEO and power
him on, he will load the stored *.urf* and execute the stored commands
and ready the necessary sensor listeners.

File Structure
==============

There are several important directories for PLEO:

            build\
            include\
            motions\
            sounds\
            

The *build* directory is where the built project file is kept. *motions*
and *sounds* hold the motion files (.csv) and sound files (.wav)
respectively. In the *include* directory, there should be several .xml
and .inc files - commands, motions, sounds, scripts, and
user\_properties. In the root directory of the project, there will be
several files with the .p file extension. These are the PAWN script
files that will store your code. Finally, there is one .urf file. This
is almost like a makefile - it gives the compiler a listing of all
motions, sounds, commands, and scripts.

Logging
=======

If you build off of the template, PLEO will log messages to the SD card
in the file *log.out* in the root directory. There is a lot of output,
but it contains battery status information, firmware info, and any debug
outputs you print. If you run into problems, try using the log functions
to log output near trouble spots.

Adding Sounds/Motions
=====================

A note before we start - when assigning IDs to new sounds and motions in
the xml files, they need to be in the following ranges:\
Sound: $4096-32767$\
Motion: $8192-32767$\

1.  Copy your motion .csv files in to the motions directory, and sounds
    into the sounds directory.

2.  Open your .urf file in the root project directory, and add entries
    in the appropriate categories for your motions and sounds. You need
    to specify the file path to your new motions and sounds (including
    the file extension).

3.  When referencing the sounds/motions in your code, you need to prefix
    them with snd/mot. For example, to have PLEO run dance.csv, you
    would put:

                        motion_play(mot_dance)
                        

After calling motion\_play, you should probably put

        while(motion_is_playing(mot_name))
        {
             sleep;
        }
        

so nothing can interfere when PLEO is playing back the motion.

Resources
=========

The documentation folder in the pdk contains a more complete guide to
getting started. There is also an interactive help program with
references to various functions. However, the help program is not very
informative, and has incorrect information in some places.
<http://bobthepleo.com/forums/> is a good resource for checking on
questions you might have about PLEO. Search the programming and
development boards. If there are any addition questions, send me an
email at emvasey@mtu.edu
