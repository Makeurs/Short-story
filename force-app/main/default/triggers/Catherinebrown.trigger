trigger Catherinebrown on User (before insert) {
    for (User i: trigger.new) {
        i.Forecastenabled= True;
    }
}