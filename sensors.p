// Very simple sensors.p example. Add code to on_sensor for those
// sensors you would like to respond to.
// TTS: http://www.cepstral.com/en/demos
// save space by packing all strings
#pragma pack 1

#include <Log.inc>
#include "common/message_type.inc"
#include <Camera.inc>
#include <Property.inc>
#include <Script.inc>
#include <Sensor.inc>
#include <Motion.inc>
#include <Sound.inc>
#include <File.inc>
#include <Time.inc>
#include <Application.inc>

//local includes
#include "commands.inc"
#include "user_properties.inc"
//used for custom sounds
#include "sounds.inc"
#include "motions.inc"

public init()
{
    Debug("sensors:init() enter\n");
    Debug("sensors:init() exit\n");
}

public on_sensor(time, sensor_name: sensor, value)
{
    new name[32];

    sensor_get_name(sensor, name);

    Debug("sensors:on_sensor(%d, %s, %d)\n", time, name, value);

    switch (sensor)
    {
        //when head is touched, move forward
        case SENSOR_HEAD:
        {
            motion_play(mot_com_walk_fs);

            // Pause and wait for the motion to finish playing.
            while (motion_is_playing(mot_com_walk_fs))
            {
                sleep;
            }
        }

        case SENSOR_PICKED_UP:
        {
            sound_play(snd_growl);
        }

        case SENSOR_CHIN:
        {
            sound_play(snd_thesaurus_pun);
            motion_play(mot_thesaurus_pun_mot);
            while(motion_is_playing(mot_thesaurus_pun_mot))
            {
              sleep;
            }
        }

        case SENSOR_TOUCH_PETTED:
        {
            sound_play(snd_sq1_excited01);
            motion_play(mot_wag_front_back);

            while(motion_is_playing(mot_wag_front_back))
            {
                sleep;
            }
        }

        case SENSOR_ABUSE:
        {
            new oldVol;
            oldVol = sound_get_volume();
            sound_set_volume(150);
            sound_play(snd_alarm_beep);

            while(sound_is_playing(snd_alarm_beep))
            {

            }

            sound_set_volume(oldVol);
        }
    }
    // reset sensor trigger
    return true;
}

public close()
{
    Debug("sensors:close() enter\n");

    Debug("sensors:close() exit\n");
}
