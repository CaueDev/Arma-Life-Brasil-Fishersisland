class CfgSounds {
	sounds[] = {};

	/* A3PL */
	class firework1 {
		name = "Firework 1";
		sound[] = {"@A3PL_Objects\Small\Sounds\firework1.ogg", 20, 1};
		titles[] = {0,""};
	};
	class firework2 {
		name = "Firework 2";
		sound[] = {"@A3PL_Objects\Small\Sounds\firework2.ogg", 20, 1};
		titles[] = {0,""};
	};
	class firework3 {
		name = "Firework 3";
		sound[] = {"@A3PL_Objects\Small\Sounds\firework3.ogg", 20, 1};
		titles[] = {0,""};
	};
	class halloweentheme {
		name = "Halloween Theme";
		sound[] = {"@A3PL_Common\effects\shortHWtheme.ogg", 10, 1};
		titles[] = {0,""};
	};
	class halloweenhorn {
		name = "Halloween Horn";
		sound[] = {"@A3PL_Common\effects\horn.ogg", 15, 1};
		titles[] = {0,""};
	};

	/* Dispatch */
	class fifrdispatch {
        name = "fifrdispatch";
        sound[] = {"@cauedev.github.io\sounds\medical\emsdispatch.ogg", 1.0, 1};
        titles[] = {};
    };
	class sdpanic {
        name = "sdpanic";
        sound[] = {"@cauedev.github.io\sounds\police\panic.ogg", 1.0, 1};
        titles[] = {};
    };

	/* Robbery */
	class lockpick {
        name = "lockpick";
        sound[] = {"@cauedev.github.io\sounds\crime\lockpick.ogg", 1.0, 1};
        titles[] = {};
    };
	class Car_Alarm {
        name = "Car_Alarm";
        sound[] = {"@cauedev.github.io\sounds\vehicles\carAlarm.ogg", 15, 1};
        titles[] = {};
    };
};
