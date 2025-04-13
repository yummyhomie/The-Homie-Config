{
    programs.alacritty = {
        enable = true;
        settings = {
            window = {
                padding.x = 16;
                padding.y = 8;
                opacity = 0.93;
            };
            cursor = {
                style = {
                    shape = "Block";
                    blinking = "On";
                };
                blink_interval = 400;
            };
        };
    };
}
