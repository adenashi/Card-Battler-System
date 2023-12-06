class_name AimState
extends CardState

var _clickTimeout : float = 0.05
var _thresholdMet : bool = false
var _timer

func EnterState() -> bool:
	StartClickTimer()
	
	# Can we play this card at all?
	if SM.Owner.CanPlay():
		if SM.Owner.Player is HumanPlayer:
			# Tell the AimController where to start aiming from
			Dispatch.StartAiming.emit()
			# Listen for when aiming is finished
			Dispatch.TargetAcquired.connect(TargetAcquired)
		return true
	else:
		return false


func StartClickTimer():
	_thresholdMet = false
	_timer = Timer.new()
	_timer.wait_time = _clickTimeout
	_timer.one_shot = true
	_timer.timeout.connect(FreeTimer)
	add_child(_timer)
	_timer.start()


func FreeTimer():
	_thresholdMet = true
	_timer.queue_free()


func Input(event : InputEvent):
	if !_thresholdMet:
		return
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			SM.UpdateState(CardStateMachine.State.HAND)


func TargetAcquired(_target : BaseTarget):
	SM.UpdateState(CardStateMachine.State.PLAYED)


func ExitState() -> bool:
	Dispatch.TargetAcquired.disconnect(TargetAcquired)
	return true
