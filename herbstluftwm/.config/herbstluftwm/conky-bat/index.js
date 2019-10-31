#!/usr/bin/env node
'use strict';

var linuxBattery = require('linux-battery');

linuxBattery().then(batteries => {
    batteries.forEach(battery => {
        var color = battery.warningLevel !== 'none' ? '#ff0000' : '#eee8d5';
        var stateSymbol = battery.state === 'charging' ? '↑' : '↓';
        var timeLeft = battery.timeToFull || battery.timeToEmpty || '';

        var text = `%{F${color}}${battery.percentage} ${stateSymbol} ${timeLeft}%{F-}`;
        console.log(text);
    });
});
