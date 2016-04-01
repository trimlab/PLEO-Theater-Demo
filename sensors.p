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
          sound_set_volume(200);
          motion_play(mot_roar);
          sound_play(snd_roar);
          while(motion_is_playing(mot_roar))
          {
            sleep;
          }

          sound_set_volume(100);

          sound_play(snd_PLEO_Line);
          motion_play(mot_PLEO_Line_Motion);

          while(motion_is_playing(mot_PLEO_Line_Motion))
          {
            sleep;
          }
        }

        case SENSOR_CHIN:
        {
            motion_play(mot_dance);
            while(motion_is_playing(mot_dance))
            {
              sleep;
            }

            motion_play(mot_dance);
            while(motion_is_playing(mot_dance))
            {
              sleep;
            }

            motion_play(mot_dance);
            while(motion_is_playing(mot_dance))
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

        case SENSOR_WAKEUP:
        {
          app_unload("theater_play.urf", true);
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
