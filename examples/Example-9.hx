enum DataChange {
    Modify<T>(oldValue:T, newValue:T);
    Delete;
}

class Test {
    static function main() {
        handleChange(["map", "items", "1", "state"], Modify("building", "idle"));
        handleChange(["map", "items", "2"], Delete);
    }

    static function handleChange(path:Array<String>, change:DataChange) {
        switch [path, change] {
            case [["map","items", Std.parseInt(_) => itemId, "state"], Modify(_, newLocation)]:
                trace('state of $itemId has changed to $newLocation');
            case [["map", "items", Std.parseInt(_) => itemId], Delete]:
                trace('item $itemId removed');
            case _:
                // do nothing
        }
    }
}