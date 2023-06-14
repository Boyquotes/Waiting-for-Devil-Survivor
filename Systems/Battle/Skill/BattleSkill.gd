@tool
class_name BattleSkill
extends InstantiableDataRecord


const Category := BattleSkillConstants.Category

const POWER_MIN := BattleSkillConstants.POWER_MIN
const POWER_MAX := BattleSkillConstants.POWER_MAX
const CHANCE_MIN := BattleSkillConstants.CHANCE_MIN
const CHANCE_MAX := BattleSkillConstants.CHANCE_MAX


@export var text_name: String = ""
@export_multiline var text_description: String = ""

@export var category := Category.COMMAND

@export var element: BattleElement = null

@export_range(POWER_MIN, POWER_MAX) var power: int = POWER_MIN

@export_range(CHANCE_MIN, CHANCE_MAX) var hit_chance: int = CHANCE_MIN

@export_range(CHANCE_MIN, CHANCE_MAX) var critical_chance: int = CHANCE_MIN
