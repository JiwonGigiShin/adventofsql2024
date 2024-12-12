-- 'Twas the month before Christmas, and all through Santa's high-tech command center, not a keyboard was clicking, not even a printer... Until suddenly, BEEP! BEEP! BEEP!

-- "Oh dear, oh my!" exclaimed Pixel, the head of Santa's IT elf team, adjusting his candy-cane striped glasses. "The Northern Lights are acting up again! They've scrambled our letters database!"

-- You see, this year, Santa had modernized his mail system to handle the billions of electronic letters coming in from children worldwide. But the magical Aurora Borealis, extra sparkly this season, had interfered with the database servers, turning perfectly good Christmas wishes into a jumble of integers!

-- To make matters worse, the backup system (managed by two excitable elf twins, Binky and Blinky) had split the data across different tables, and somehow mixed in random "holiday sparkles" (aka noise) into the data.


    SELECT CHAR(value)
    FROM letters_a
    WHERE value BETWEEN 65 AND 90
    OR value BETWEEN 97 AND 122
    OR value IN (32,33,34,39,40,41,44, 45, 46, 58, 59, 63)
    UNION ALL
    SELECT CHAR(value)
    FROM letters_b
    WHERE value BETWEEN 65 AND 90
    OR value BETWEEN 97 AND 122
    OR value IN (32,33,34,39,40,41,44, 45, 46, 58, 59, 63)
