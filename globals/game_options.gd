extends Node

var master_volume : float = 1 :
    set(value):
        master_volume = value
        EventBus.master_volume_changed.emit(master_volume)