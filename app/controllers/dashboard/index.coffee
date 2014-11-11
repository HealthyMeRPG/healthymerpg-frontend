`import Ember from 'ember'`

{ moment } = window

DashboardController = Ember.ObjectController.extend(

  needs: ['application']

  currentDate: null
  currentUser: Ember.computed.oneWay('controllers.application.currentUser')

  score: null
  queryParams: {
    currentDate: "date"
  }

  fetchScore: (->
    unless @get('currentUser')?
      @set('score', null)
      return

    @get('currentUser.score').then((score) =>
      @set('score', score)
    )
  ).observes('currentUser').on('init')

  staminaClass: (-> @scoreAttributeClass('stamina')).property('score.stamina')
  strengthClass: (-> @scoreAttributeClass('strength')).property('score.strength')
  mindClass: (-> @scoreAttributeClass('mind')).property('score.mind')
  vitalityClass: (-> @scoreAttributeClass('vitality')).property('score.vitality')
  agilityClass: (-> @scoreAttributeClass('agility')).property('score.agility')

  scoreAttributeClass: (attribute) ->
    value = @get("score.#{attribute}")
    if value > 79
      'alert-success'
    else if value > 49
      'alert-warning'
    else
      'alert-danger'

  currentDateFormatted: (->
    if Ember.isEmpty(@get('currentDate'))
      moment().format("MMMM Do, YYYY")
    else
      moment(@get('currentDate')).format("MMMM Do, YYYY")
  ).property('currentDate')

  actions: {
    previousDay: ->
      currentDate = @get('currentDate')
      currentDate ||= new Date()
      @set('currentDate', moment(currentDate).subtract(1, 'day').format("YYYY-MM-DD"))
    nextDay: ->
      currentDate = @get('currentDate')
      currentDate ||= new Date()
      tomorrow = moment(currentDate).add(1, 'day')
      if moment(currentDate).isSame(moment(), 'day') || moment().isSame(tomorrow, 'day')
        @set('currentDate', null)
      else
        @set('currentDate', tomorrow.format("YYYY-MM-DD"))
  }

)

`export default DashboardController`
