package ${packageName}.presentation

//TODO: create view state class
sealed class ${featureName}ViewState
data class ${featureName}Result(val value: String? = null) : ${featureName}ViewState()
object ${featureName}ResultError : ${featureName}ViewState()