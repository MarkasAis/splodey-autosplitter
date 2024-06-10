state("Splodey") {
    int levelID : "Splodey.exe", 0xC1FB88
}

startup {
    vars.menuID = 2;
    vars.hubID = 188;
    vars.creditsID = 189;
    vars.transitions = new Dictionary<int, int> {
        { 134, vars.hubID },
        { 60, vars.hubID },
        { 84, vars.hubID },
        { 105, vars.creditsID }
    };
}

split {
    if (!vars.transitions.ContainsKey(old.levelID)) return false;
    int transition = vars.transitions[old.levelID];
    print(current.levelID.ToString());
    return current.levelID == transition;
}

start {
    if (current.levelID == old.levelID) return false;
    return current.levelID == vars.hubID;
}

reset {
    if (current.levelID == old.levelID) return false;
    return current.levelID == vars.menuID;
}